import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //lista vacia de enteros que luego seran añadidos por elementos cada vez que el ciclo for se ejecute y aumente 10 nuevo elementos o items0
  List<int> _listaNumeros = new List();
  //Cuando se crea este StatefulWidget y se muestre la pagina mi ultimo número va ser el 0, es decir el valor inicial
  int _ultimoItem = 0;
  //estea propiedad de tipo ScrollController lo voy usar para poder controlar un scroll o widgets escrolables
  ScrollController _scrollController = new ScrollController();
  //este se va poner true cada vez que quiera cargar nuevos elementos al Scroll
  bool _isLoading = false;//este valor va cambiar cada vez que llame el metodo traerInfo, es decir cada vez que requiera cargar mas elemetos al Scroll

  @override
  void initState() {//el initState es un método que llama el super.initState donde el super hace referencia a la clase State y la inicializa
    super.initState();
    //aca voy llamar el metodo que me permite agragar 10 elementos cada vez que se llame
    _agregar10();
    //agragamos el Listener a mi _scrollController y este se va disparar cada vez que se mueva el scroll, es decir este escucha cuando se esta haciendo scroll
    _scrollController.addListener(() {
      //agragamos una condicion para saber cuando cuando el scr
      //si el la posicion de pixeles del _scrollController es igual al largo maximo de pixeles en la posicone del _scrollController
      //ejem: si la la poscion actual es de 1000 pixeles y el scroll maximo es de 100 pixeles quiere decir que estamos al final de la pagina o pantalla
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        // _agregar10();//Entonces cuando estoy al final de la pantalla agrego 10 nuevos elementos para que se carguen y siga haciendo Scroll
        traerInfo();//llamamos este metodo que resuelve un Future, es decir estamos simulando un consumo http
      }
    });
  }

  //este metodo se dispara cuando la esta pagina deja de existir, es decir cuando me salgo de esta pagina destruye dicha pagina y prevenir fugas de memoria
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();//el .dispose va descartar cualquier recurso utilizdo por este objeto
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(//Stack pone elementos encima de otros elementos, es decir los apila uno sobre otros
        children: <Widget>[
          _crearLista(),//llamamos el metodo que es un widget
          _crearLoading()
        ],
      )
      
      
    );
  }

  ///Método que va crear listas de imagenes usando el ListView.builder
  Widget _crearLista() {
    //El ListView.builder se va encargar de renderizar los elementos conforme sean necesarios
    //builder en fluter significa la forma en como se va dibujar ese elento o widged
    return RefreshIndicator(//este listView.builder va ser envuelta por el ResfreshIndiacator
      onRefresh: obterPagina1,//onRefresh es requerido y tiene que recibir un Future, porque cuando ese Future se resuelva automaticamente se va cancelar el simpbolo del refreshIndicator
      child: ListView.builder(
        controller: _scrollController,//controller recibe el objeto de tipo ScrollController
        itemCount: _listaNumeros.length,//recibe valores de tipo entero, es decir la cantidad de elementos o item que tiene la propiedad _listaNumeros
        //es el método que se va encargar de redibujar los elementos que se encuentran dentro de esta lista.
        //Es decir el ListView.builder se va encargar de renderizar los elementos conforme se necesario
        itemBuilder: (BuildContext context, int index) {//creamos los métodos que necesita: recibe un BuildContext y un int que es la posición indice del elemento que esta creando en ese instante por jemplo: estamos en en la poscion 1 seria el 0, si estamos en la segunda posición seria un 1. Es decir las images que esta mostrando en ese momento en la pantalla.
          final imagen = _listaNumeros[index];//imagen va tener los valores de cada elemento que haya en la lista
          // print(index);  [0 1 2 3]
          // print(imagen); [1 2 3 4]
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),//dentro de la url ponemos la variable de tipo int imagen
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  ///este metodo Future va se va ejecutar cuando hagamos un refresh al listView.builder
  Future<Null> obterPagina1() async {
    final duration = new Duration(seconds: 2);//la duracion de carga o este tiempo se va tardar en cargar todas las magens
    new Timer(duration, () {
      _listaNumeros.clear();//cuando pase la duracion voy a borrar todo el contenido de _listaNumeros para que cuando volvamos a hacer Scroll hacia abajo cargue otras imagenes
      _ultimoItem++;//queremos nuevas images para el refresh por eso le sumamos
      _agregar10();//como ya tenemos cargado entonces agregamos esos 19 elemtos o imagenes 
    });
    return Future.delayed(duration);//retornamos Future le pasamos el delayed(retrasar) y este retrazo va ser de 2 segundo y de esta manera se va tardar 2 segundo antes de mostra las nuevas images al hacer el refresh
  }

  ///Este método cada vez que lo llame se va encargar de agragar 10 elementos a la listaNumeros.
  void _agregar10() {
    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;//al valor inicial que es 0 le vamos ir agragando nuevos numeros, entonces ya no sera 0, entonces sera 1, luego 2, y haci hasta cumplir la condicion del ciclo for
      // print(_ultimoItem); [1 2 3 ....10]
      _listaNumeros.add(_ultimoItem);//va ir agregando elementos 1 en 1 hasta llegar a 10
    }
    setState(() {});//va redibujar con los nuevos 10 valores
  }

  ///Metodo que me va permitir traer infomacion simuladon una perticion http, es decir para cargar las imagenes vamos hacer una perticion http que puede demorar unos cuantos segundos
  Future<Null> traerInfo() async {//async para poder usar el await
    _isLoading = true;//cada vez que llamen traerInfo este va tener valor true, es decir que si requiere carga mas elementos
    setState(() {});//para que se redibuje porque esa propiedad cambio

    final duration = new Duration(seconds: 2);
    //Este Timer(temporizador) necesita la duracion y una funcion que se va ejecutar cuando cumpla dicha duracion, solo le pasamos la referencia al metodo es por eso que no tiene el ()
    return new Timer(duration, respuestaHTTP);
  }

  //Este metodo se va ejecutar cuando pase los 2 segundos de duracion que se le establecio en el Timer ya que ahi es donde se va ejecurtar este metodo
  void respuestaHTTP() {
    _isLoading = false;//volvemos el valor a falso porque ya termino de cargar, es decir que ya paso los 2 segundos que es el tiempo de carga y luego lo volvemos a false para que ya no cargue mas
    //setState() este metodo ta no necesitariamos porque ya esta implementado en el metodo _agregar10
    //animamos el _scrollController cuando se cargaron los nuevo elementos mostrarndo una pqueña parte de esa carga para que el usuario vea que esas imagenes ya estan cargadas
    _scrollController.animateTo(//este va permitir mostrar una pequeña parte la primera imagen cargada
      _scrollController.position.pixels +100,//cuando llega al final y hace el Loading el scroll se mueve automaticamente para que muestre una pequeña parte de lo que ya a cargado
      curve: Curves.fastOutSlowIn,//son animaciones o efectos que se aplican de forma animada al mostrar algun elemento o en donde se permita usar el Curve
      duration: Duration(milliseconds: 250)//la duracion de la animacion
    );

    _agregar10();//cuando ya paso la duracion disparamos este metodo que va agragar los 10 elementos que fueron cargados
  }

  ///este widget va retornar un inicador de progreso de carga
  Widget _crearLoading() {
    //hacemos esta condicion para saber si se esta cargando o no, si es true va mostrar el CircularProgresIndicator
    if(_isLoading) {
      return Column(//el circular progres va estar en una row que a su vez este row va estar dentro de un column
        mainAxisSize: MainAxisSize.max,//tamaño del eje principal va ser el maximo, es decir el tamaño que va ocupar la columna va ser todo el maximo disponible
        mainAxisAlignment: MainAxisAlignment.end,//la alineacion del eje principal va estar al final, es decir la columna va estar alineada al final de la pantalla
        children: <Widget>[
          Row(//este row va estar dentro de la culumna que esta alineado al final de la pantalla
            mainAxisAlignment: MainAxisAlignment.center,//como esta al final en el lado izquierdo entonces lo movemos al centro de la parte final de la pantalla
            children: <Widget>[
              CircularProgressIndicator()//aca llamamos este circular progress indicator.
            ],
          ),
          SizedBox(height: 18.0)//dentro de la columna justo depues del row pongo una caja para separar el row del limite de la pantalla final
        ],
      );
      
      
    } else{
      return Container();
    }
  }

}
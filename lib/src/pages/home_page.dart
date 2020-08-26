import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes'),
      ),
      body: _lista(), //llamamos este método que es una lista de Widget para usarlo como ListView
    );
  }

  Widget _lista() {
    // print(menuProvider.opciones); //para mostrar en consola que si se esta leyendo el Json
    //FutureBuilder es un widget que perimite dibujarse a si mismo basado en la ultima instatanea(snapshot) que interactuo con un Future
    return FutureBuilder(
      //future recibe lo que nosotros queremos esperar, osea nuestro Future que creamos que es el metodo cargarData que es el que regresa un Future
      future: menuProvider.cargarData(),
      //este argumento es opcional y recibe la información que va tener por defecto mientras no se haya resuelto el Future, es decir que es el valor que se le va mandar al snapshot.data hasta que se resuelva el cargarData() que es el Future
      initialData: [],  //en este caso va tener una lista vacia, aca podemos crear un loading, que haga el efecto de que la data se esta cargando
      //esta propiedad es obligatoria que recibe una funcion que esta tiene como argumento el tipo BuildContex y el AsyncSnapshot que este es del mimo tipo que el future: esta esperando y esta fucion retorna un Widget Builder
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(  //ListView permite hacer scroll en el contenido que tenga internamente
          children: _listaItems( snapshot.data, context ), //llamamos la lista de widget que emos creado abajo
        );
      },
    );

  }

  //este metodo va retornar un lista de widget
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {  //recibe como argumento la data del FutureBuilder, y con esta data ya podemos trabajar para poder leerlo y convertirlo en una lista de Widget
    
    final List<Widget> opciones = [];
  //usamo el forEach para barrer los elementos de la data
    data.forEach((element) { //element recibe cada elemento de la data uno por uno
      final widgetTemp = ListTile(
        title: Text( element['texto']), //texto es la llave en el Json
        leading: getIcon( element['icon']),  //icono al principio
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),  //icono al final
        //añadimos el metodo onTap al ListTitle para que sea clickeable
        onTap: () {
          //pushNamed nos permite navegar con rutas con nombre, donde aca recibimos el nombre de la ruta leido del Json
          Navigator.pushNamed(context, element['ruta']);

          // //usando el navigator.push podemos navegar de una pagina a otra
          // final ruta = MaterialPageRoute(
          //   builder: (context) => AlertPage() //retorna la pagina a la cual queremos navegar
          // );
          // Navigator.push(context, ruta);  //recibe el context(para saber en que punto esta creando esta pagina) y la ruta que tiene que ser de MateriaPageRoute que navega a la siguiente pantalla

        },
      );
      //a medida que vaya leyendo cada elemento va entrar a widgetTemp y este sera añadido a la lista de widget opciones
      opciones..add( widgetTemp ) //añadimos a lista que fue creada vacia
              ..add( Divider() );
    });
    //y al fin retorna todo esto como una lista de Widget y lo usaremos en _lista que a su vez sera usada en HomePage
    return opciones;

  }

}
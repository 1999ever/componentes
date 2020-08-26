//Este archivo solo es para demostracion que no sera usado al final

import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  // const HomePageTemp({Key key}) : super(key: key);

  //esta lista de string lo vamos a convertir en una lista de widget
  final List<String> opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,  //centra el titulo del AppBar
        title: Text('Componentes Temp'),
        backgroundColor: Colors.amber,
      ),
      body: ListView( //ListView permite hacer scroll en el contenido que tenga internamente
      //children: _crearItems()
        children: _crearItemsCorta()  //llamamos la lista de widget que creamos abajo
      ),
    );
  }

  //_crearItems lo que hace es retornar la lista de mis items que yo quiero mostrar en el ListView
  //entonces este método va retornar una lista de widget que luego le pasaremos al children
  List<Widget> _crearItems() {

    List<Widget> listaTemp = new List<Widget>();  //esta es una lista dinamica
    //barremos cada elemento de la lista opciones
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text( opt ),
      );
      //ahora voy tomar cada elemento del widgetTemp y lo voy insertar a mis listaTemp
      listaTemp..add( tempWidget )
               ..add( Divider() );  //crea una linea que es como un separador
    }
    //ahora voy retornar la listaTemp que ahora es la que tiene la nueva colección de widger
    return listaTemp;
  
  }

  //forma corta para retornar la lista de mis items para luego ser mostrados en el ListView
  List<Widget> _crearItemsCorta() {
    //retornar una nueva lista cuyos items han sido transformados en widget pasando por el método .map()
    return opciones.map((item) => Column( //usamos el método map que tienen las listas
      children: <Widget>[
        ListTile(
          title: Text(item + '!'),
          subtitle: Text('Hola mundo'),
          leading: Icon(Icons.add_alarm), //un widget que se coloca al inicio de ListTitle
          trailing: Icon(Icons.keyboard_arrow_right), //este widget se coloca al final de ListTitle
          onTap: () {}, //este método para que se puedad hacer clicks en esta ListTitle
        ),
        Divider()
      ],
    ) ).toList();//sin el toList lo que estaba retornando era una un Iterable<ListTitle>, pero yo estaba esperando una List<ListTitle>, entonces para eso usamos el toList

  }
  

}
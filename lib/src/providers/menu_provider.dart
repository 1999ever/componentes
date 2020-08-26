//vamos consumir un archivo Json de manera local

import 'dart:convert';  //para decodificar un archivo Json
//usanodo la palabra show seguido del método rootBundle significa que solo este método sea visible de todo el paquete, es decir que exporte solo dicho método
import 'package:flutter/services.dart' show rootBundle; //paquete de rutas que me servir para leer el Json


class _MenuProvider {
  //lista inicializada vacio
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();  //no podemos usar un metodo async en un constructor
  }

  //creamos este método que va permitir consumir el Json
  Future<List<dynamic>> cargarData() async {
    //todo esto retorna un Future
    final resp = await rootBundle.loadString('data/menu-opts.json');  //se ha leido el Json, pero nos retorna un String que dentro de ese String esta recien el Json
    //leemos el JSON y le docodificamos para convertirlo en un mapa
    Map dataMap = json.decode(resp);
    // print(dataMap['nombreApp']); //ya fue decodificado y convertido a un mapa
    opciones = dataMap['rutas'];

    return opciones;  //estas opciones se va mostrar en el ListView

  }

}
//instanciamos la clase privada que solo sera intanciada una solo vez
final menuProvider = new _MenuProvider();
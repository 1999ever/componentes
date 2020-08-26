import 'package:flutter/material.dart';

//mapa de iconos que tiene como llave el string(nombre del icono) y valor el IconData
final _icons = <String, IconData> {

  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'         : Icons.input,
  'tune'          : Icons.tune,
  'list'          : Icons.list,

};

///este método de tipo Icon que recibe el nombre del icono en forma de String. Estos nombres deben estar previamente declarado en el archivo Json
Icon getIcon( String nombreIcono ) {
  //retorna el icono 
  return Icon( _icons[nombreIcono], color: Colors.blue);

}
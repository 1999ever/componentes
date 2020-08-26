//En este archivo van estar solo las rutas de mi aplicación
import 'package:flutter/material.dart';

// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listView_page.dart';


///Metodo que contiene todas las rutas de mi Aplicación, dentro de esta debo colocar tadas las rutas que voy ocupara cada una con sus respectivo nombre el cual ya fue declarado en el archivo local Json.
Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder> {

    // '/'      : ( BuildContext contex ) => HomeTemp(),
    '/'       : ( BuildContext contex ) => HomePage(), //pagina de inicio
    'alert'   : ( BuildContext contex ) => AlertPage(),
    AvatarPage.pageName  : ( BuildContext contex ) => AvatarPage(),//otra patron para nombrar las ruta de las paginas o otro forma de crear una pagina de rutas
    'card'    : ( BuildContext contex ) => CardPage(),
    'animatedContainer' : ( BuildContext contex ) => AnimatedContainerPage(),
    'inputs'  : ( BuildContext contex ) => InputPage(),
    'slider'  : ( BuildContext contex ) => SliderPage(),
    'list'    : ( BuildContext contex ) => ListaPage(),
  };

}

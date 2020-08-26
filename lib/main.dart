import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart'; //esta esta porque lo usamos en onGenerateRoute

void main() => runApp(MyApp());

///Clase principal de mi aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',  //titulo de la Aplicación
      debugShowCheckedModeBanner: false,  //ocultar la cinta roja del baner
      //cambiar idioma a español, esto es porque el selector de fecha estaba en ingles
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Spanish, no country code
      ],
      // home: HomePage()  //Llamamos la pagina de inicio, esto ya no es necesario porque creamos rutas con nombres
      initialRoute: '/',  //esta es la ruta inicial
      routes: getApplicationRoutes(), //llamamos este metodo que tiene todas las rutas de mi app
      //este metodo se va dispara cuando el nombre de la ruta no esta definida en routes como es el caso de la ruta card(nota: como ya esta definida esta ruta, esta funcion ya no se va disparar, solo cuando esta se dispara en caso de que no encuentre una ruta definida )
      //es una funcion que regresa una ruta de cualquier tipo, es decir una ruta dinámica
      onGenerateRoute: ( RouteSettings settings ){
        // print('Ruta llamada: ${ settings.name }'); //para demostrar que si se esta llamando a esa ruta
        //retornamos la ruta
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );

      },
    );
  }
}
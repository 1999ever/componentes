import 'dart:math';

import 'package:flutter/material.dart';

///Clase que me va permitir animar un Container y cambiar su valor dinamicamente, sera un StatefulWidget porque las propiedades de ese contenedor yo las voy a tener que cambiar.
class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  //creamos 4 propiedades, donde las 2 primeras formaran el container y las 2 ultimas la decoración del mismo
  double _width   =  60.0;
  double _heigth  = 60.0;
  Color _color    = Colors.pink;
  BorderRadiusGeometry _borderRadius =  BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer( //creamos el container inicial
          duration: Duration(milliseconds: 700),//parametro requerido para el AnimatedContainer
          curve: Curves.ease, //Los Curves son animaciones predefinidas, Es decir son efector pregrabados para producir animaciones de diferente formas
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon( Icons.play_arrow,),
        onPressed: _cambiarForma  //llamamos el metod creado abajo, pero notemos que se llama el método per sin parecentecis, esto es porque dicho método se va ejecutar solo cuando se hace click en el boton.
      ),
    );
  }

  ///Método que va ser encargado de cambiar la forma y animación del container de forma dinámica y aleatoria.
  void _cambiarForma() {
    //El random me va permitir generar numeros de manera aleatoria para que luego dichos numeros sean usados como valores del container
    final random = Random();
    //Este setState se usa cuando cambio el valor por ejemplo de alguna propiedad y necesito que se redibuje. Es decir el setState se va dispara y va notar un cambio y inmediatamente va redibujar con los cambios que a notado.
    setState(() {
      //alto y ancho aleatorio
      _width  = random.nextInt(300).toDouble();//_width == a un random donde nextInt es el siguiente numero entero y dentro de ella va el número máximo que va ser 300 empezando de 0, luego todo eso convertimos a un double que el el tipo de dato de la propiedad _width.
      _heigth = random.nextInt(300).toDouble();
      //colores aleatorios
      _color  = Color.fromRGBO( //R=Red, G=Green, B=Blue y O=Opacity
        random.nextInt(255), //valor del rojo de forma aleatoria nextInt(siguiete entero)
        random.nextInt(255), //valor del verde
        random.nextInt(255), //valor del azul
        1.0 //valor de la opcidad
      );
      //border radio circular aleatorios
      _borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble()  //valor alartorio para el borderRadius circular, en donde el numero maximo es 100
      );
    });
  }

}
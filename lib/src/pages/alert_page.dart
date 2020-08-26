import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(  //tipo de boton
          child: Text('Mostrar Alerta'),  //texto en el boton
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(), //forma del borde
          //onPressed es requerido y recibe una funcion
          onPressed: () => _mostrarAlerta(context), //esta funcion enviamos el contex de la pagina
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add_location ),
        onPressed: () => Navigator.pop(context),  //con Navigator.pop podemos volver a la pagina anterior usando un icono
      ),
    );

  }


  void _mostrarAlerta(BuildContext context) { //recibimos el contex de la pagina, ya que es requerido en el showDialog
    showDialog(
      context: context,  //contex recibe el contex de la pagina
      barrierDismissible: false, //es para que se cierre la alera haciendo click fuera de ella, false seria para que no se pueda cerrar haciendo click en cualquier lugar, sino solo haciendo click en un lugar en especifico
      //es la funcion encargada de crear ya todo el Dialog, es decir aqui cramos el contenido que va tener dicha alerta
      builder: (context) {  //recibe una fucion que dentro de ella recibe el contex de la pagina
        //el buider tiene que retornar un widget que es el que vamos a mostrar
        return AlertDialog( //este widget tiene muchas propiedades que varemos a continuación
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),  //titulo de la alerta que es un widget
          content: Column( //contenido de la alerta es cualquier widget
            mainAxisSize: MainAxisSize.min, //mainAxisSize que recibe MainAxisSize y esta tiene dos valores que uno es min que le dice que se adapte al contenido que tiene interno
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
}
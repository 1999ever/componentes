import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  //este valor representa el punto en donde va esta el foco inicial del slider
  double _valorSlider = 100.0;
  //valor inicial del check va ser falso, es decir el checkbox va esta desactivado
  bool _bloquerCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }


  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      // divisions: 20,  //crea puntos de division dependiendo al valor que se le de, en este caso van aparecer puntos cada 20 de distancia
      //tiene que cumplir que value >= min && value <= max
      value: _valorSlider, //el valor en donde va esta el foco del slider y este debe estar en medio del valor min y max
      min: 10.0,  //El valor minimo o el valor del punto inicial del slider
      max: 400.0, //El valor maximo del slider
      //onChange recibe null si _bloquerCheck es falso, por ende se desabilita el slider porque cuando el onChange recibe null el slider que bloqueado. Si recibe true va quedar activado y va funcionar normal
      onChanged: (_bloquerCheck) ? null : (value) {
        setState(() {  //va redibujar el nuevo valor o la nueva posicion del punto del slider
        _valorSlider = value; //el valor inicial del slider va ser igual al nuevo valor que selecciono el usuario en el slider
        });
      },
    );

  }


  Widget _crearCheckBox() {
    //Checkbox crea una caja pequeña de check que se puede activar y desactivar
    // return Checkbox(
    //   value: _bloquerCheck,
    //   onChanged: (value) {
    //     setState(() {
    //     _bloquerCheck = value;
    //     });
    //   },
    // );
    //CheckboxListTile crear una conbiancion de list title y una caja de check
    return CheckboxListTile(
      title: Text('Bloquear Slider'),//se puede poner un titulo y con esto se amplia el campo de posivilida para hacer check no solo en la caja sino en titulo igual
      value: _bloquerCheck, //el valor inicial es falso o desactivado
      onChanged: (value) {//capta un cambio en el check y ese cambio se almacena en value
        setState(() { //redibuja el check con el nuevo valor 
        _bloquerCheck = value;  //el check recibe el nuevo value
        });
      },
    );
  }


  Widget _crearSwitch() {
    // return Switch(
    //   value: _switch,
    //   onChanged: (value) {
    //     setState(() {
    //     _switch = value;
    //     });
    //   },
    // );

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquerCheck,
      onChanged: (value) {
        setState(() {
        _bloquerCheck = value;
        });
      },
    );
  }



  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://es.churchpop.com/wp-content/uploads/2019/04/Imagen-1-7.jpg'),
      width: _valorSlider,  //el ancho de la imagen va ser igual al valor del slider, Esto quiere decir que a medida que el slider va cambiando su valor entonces la imagen va ir cambiando su tamaño
      fit: BoxFit.contain,//fit ajusta la imagen dependiendo al parametro que se le da
    );
  }


}
import 'package:flutter/material.dart';

///Clase que crea una pagina de diferentes tipos de inputs. Es de tipo StatelesWidget porque voy necesitar cambiar valores en timpo de ejecución.
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //propiedades que voy usar para camptuar el texto que se ingrese en los inputs y dichos valores usarlo en lo que yo desee
  String _nombre = '';
  String _email = '';
  String _fecha;
  //propiedad que tiene el valor inicial por defecto que sera mostrado en el menu desplegable
  String _opcionSeleccionada = 'Volar';

  //esta propiedad va ser el controlador de la fecha que se seleciono y de esa manera poder manejar una relacion con la caja de input, luego llamando esta propiedad ya voy poder usar el valor que tiene
  TextEditingController _inputFieldDateController = new TextEditingController();
  //lista de poderes que sera los items o valores del menu desplegable
  List<String> _poderes = ['Volar', 'Velocidad', 'Rayos X', 'Super Fuerza','Rayos Laser'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView( //dentro del body usamos el ListView porque las cajas de input despliegan el teclado y por ende se va necesitar hacer scroll
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),//mandamos el context
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  ///Este método de tipo widget va ser el encargado de crear una caja de input o campo de texto
  Widget _crearInput() {
    //Para definir un input empezamos llamando la clase TextField(campo de texto)
    return TextField(
      // autofocus: true, //despliega automaticamente el teclado haciendo foco en dicho input
      textCapitalization: TextCapitalization.words, //capitaliza cada palabra
      decoration: InputDecoration(  //Perimite perzonalizar el input o la caja de texto
        border: OutlineInputBorder( //crea una caja o rectangulo de linea al rededor del input
          borderRadius: BorderRadius.circular(20.0), //borde del OutLineInputBorder
        ),
        counter: Text('Letras ${ _nombre.length }'),  //va contar la cantidad de caracteres que existe en la caja de input
        labelText: 'Nombre',  //es la etiqueta que va recibir la caja de input
        hintText: 'Nombre de la persona',  //es como el placeholder del input
        helperText: 'Solo es el nombre', //es un texto que aparece debajo del input en el lado izquierdo
        suffixIcon: Icon(Icons.accessibility),  //icono dentro del input al final
        icon: Icon(Icons.account_circle), //icono del input al inicio

      ),
      //onChanga recibe un método osea una funcion el cual recibe el valor actual que tiene el input, es decir lo que se escribe dentro del input
      onChanged: (value) {
        //setState me va permitir redibujar en tiempo real el valor del input, es decir cada letra que escriba se va ir mostrando
        setState(() {
        _nombre = value;  //_nombre que fue inicializado al principio es igual al valor que tiene el input
        });
        // print(_nombre);
      },
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress, //el tipo de teclado que va mostrar, es decir aca se va mostrar el teclado con el @
      decoration: InputDecoration(
        border: OutlineInputBorder( //crea una caja o rectangulo de linea al rededor del input
          borderRadius: BorderRadius.circular(20.0), //borde de la caja del input
        ),
        hintText: 'Email',  //es como el placeholder del input
        labelText: 'Email',  //es la etiqueta que va recibir la caja de input
        suffixIcon: Icon(Icons.alternate_email),  //icono dentro del input al final
        icon: Icon(Icons.email), //icono del input al inicio

      ),
      onChanged: (valor) => setState( () {
        _email = valor;
      }),
    );

  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,  //oculta la información del input
      decoration: InputDecoration(
        border: OutlineInputBorder( //crea una caja o rectangulo de linea al rededor del input
          borderRadius: BorderRadius.circular(20.0), //borde de la caja del input
        ),
        hintText: 'Password',  //es como el placeholder del input
        labelText: 'Password',  //es la etiqueta que va recibir la caja de input
        suffixIcon: Icon(Icons.lock_open),  //icono dentro del input al final
        icon: Icon(Icons.lock), //icono del input al inicio

      ),
      // onChanged: (valor) => setState( () {
      //   _email = valor;
      // }),
    );

  }

  Widget _crearFecha( BuildContext context ) { //necesitamos recibir el contex de la pagina para poder usarlo mas abajo

    return TextField(
      enableInteractiveSelection: false,  //Para que la persona no pueda copiar información del mismo
      controller: _inputFieldDateController,  //asignamos el controlador a al input
      decoration: InputDecoration(
        border: OutlineInputBorder( //crea una caja o rectangulo de linea al rededor del input
          borderRadius: BorderRadius.circular(20.0), //borde de la caja del input
        ),
        hintText: 'Fecha de nacimiento',  //es como el placeholder del input
        labelText: 'Fecha de nacimiento',  //es la etiqueta que va recibir la caja de input
        suffixIcon: Icon(Icons.perm_contact_calendar),  //icono dentro del input al final
        icon: Icon(Icons.calendar_today), //icono del input al inicio

      ),
      //El onTap va disparar un metodo que me permita a mi lanzar el selector de fecha al momento de hace tap en el input
      onTap: () {
        //Esto va permitir quitar el foco del input, esta recibe el context
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context); //al hacer tap va llamar este metodo que es el encargado de mostrar el selector de fecha
      },
    );

  }

  //este metodo va lanzar el selector de fecha que flutter tiene por defecto
  _selectDate(BuildContext context) async {//recibe el contex y convertimos este metodo en asincrono porque dentro de este metodo se va usar una funcion que resuelve un Future
    //picked de tipo DateTime(sirve para almacenar una fecha)
    DateTime picked = await showDatePicker( //showDatePicker regresa un Future
      context: context, //context recibe el context de la pagina
      initialDate: new DateTime.now(), //fecha inicial en el cual va estar el foco al momento de lanzar el selector de fecha
      firstDate: new DateTime(1990),  //solo se va poder seleccionar una fecha que este arriba del año 2000
      lastDate: new DateTime(2025), //solo se va poder seleccionar una fecha que sea inferios al año 2025
      locale: Locale('es', 'ES')
    );
    //validamos si se a seleccionado alguna fecha o no
    if( picked != null ) {
      //va permitir redibujar con el valor que se le asigne, es decir con la fecha que se selecione
      setState(() {
        //_fecha va ser igual a picked(que tiene el valor de la fecha que fue selccionado), todo esto convertido a string
        _fecha = picked.toString().substring(0,10);//para que el formato de fecha solo muestre AAAA-MM-DD
        _inputFieldDateController.text = _fecha;//_inputField le asignamos la propiedad estatica text y va ser igual a la fecha que el usuario a seleccionado
      });
    }

  }

  ///Este método me va perimitir crear el menu deplegable utilizando la lista normal de poderes y  poder retornar el menú desplegable de opciones convertidas en tipo DropdownMenuItem
  List<DropdownMenuItem<String>> getOptionDropdown() {
    //lista de tipo List que a su ves esta es de tipo DropdownMenuItem y que esta contiene Strings
    List<DropdownMenuItem<String>> lista = new List();
    //pasamos la lista de poderes por un forEach y cada elemeto de esa lista va ser recibida en la variable element
    _poderes.forEach((element) {
      //añdimos a la lista cada nuevo element que seran de tipo DropdownMenuItem
      lista.add( DropdownMenuItem(  //DropdownMenuItem crea un item para un menu desplegable
        child: Text(element), //es un argumento requerido
        value: element, //el valor a retornar si el usuario a selecionado este menu item
      ));
    });
    //retornamos la nueva lista de poderes que ahora es de tipo DropdownMenuItem<String>
    return lista;
  }

  ///Método que crea el el boton desplegable, que al pusar dentro de ella se va mostra los elementos que tiene dicho menu que fue creado por el metodo getOptionDropdown
  Widget _crearDropdown() {
    return Row( //para ordenarlo de manera horizontal
      children: <Widget>[
        Icon(Icons.menu),
        SizedBox(width: 30.0),
        Expanded(//Va expadir el boton desplegable todo el ancho restante que haya
          child: DropdownButton(  //crea el boton desplegable
            value: _opcionSeleccionada, //el valor por defecto que tendra antes de seleccionar algun otro elemento
            items: getOptionDropdown(), //Todos los intems o elementos que va tener este menu desplegable
            onChanged: (value) {  //Captura todos los cambios que haya, es decir obtiene el valor que el usuario a seleccionado
              setState(() { //redibuja el nuevo valor que el usuario a seleccionado
                _opcionSeleccionada = value;  //la opcion por defecto va cambiar o va ser igual al nuevo valor que el usuario a seleccionado
              });
            },
          ),
        ),
      ],
    );
  }



  ///Método de tipo widget que retorna un ListTitle que tiene los valores que se escriben en los inputs nombre y email, donde estos valores seran mostrados en tiempo real, es decir mientras escribe en el input
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'), //va mostrar el valor del campo de input nombre
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

}
import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, //El valor por defecto el 1.0
      shadowColor: Colors.blue, //color de la sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),//la forma de los bordes, este chape recibe diferentes tipos de shapeBorder como el RouderRectangleBorder
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Puedo escribir los versos mas tristes esta noche, por ejemplo la noche está estrellada tiritan los astros azules a lo lejos y el viento de la noche gira en el cielo y canta'),
          ),
          // Divider(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                textTheme: ButtonTextTheme.primary,
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                textTheme: ButtonTextTheme.primary,
                child: Text('Okey'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final cardWithImage = Container(  //al principio era una Card
      // clipBehavior: Clip.antiAlias, //nos ayuda a que nada lo que esta dentro de la tarjeta se salga
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          //para trabajar los loadings de la imagenes, es decir mientras se carga una imagen de internet, podemos poner una imagen o lo que sea que me indique de que la imagen se esta cargando, esto es para evitar que ese espacio quede en blanco mientra se carga la imagen, luego ya se guarda en cache
          FadeInImage(
            //la imagen que se va obtener de internet
            image: NetworkImage('https://opidesign.net/wp-content/uploads/landscape-architecture-fun-facts-outside-productions-blog-980x551.jpg'),
            //la imagen que va tener por defecto mientra carga la imagen, en este caso en un gif
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),  //le puedo dar una duración para que la imagen ya cargada pueda entrar a remplazar a la imagen por defecto
            height: 220.0,  //la altura de la imagen
            fit: BoxFit.cover,  //ajuste de como la imagen debe ocupar el espacio que tiene disponible

          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner.')
          )
        ],
      ),
    );
    //un container es como si fuese un div de html y que su alto y ancho de container va ser igual al alto y ancho que tenga su contenido que en este caso es la targeta
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),  //el border del contenedor
        color: Colors.white,  //color del contenedor
        boxShadow: <BoxShadow>[ //el boxShadow recibe una lista de tipo BoxShadow
          BoxShadow(  //este BoxShadow tiene su constructor que son las 4 propiedades usadas aca
            color: Colors.black,  // color de la caja de sombra
            blurRadius: 20.0, //el desenfoque de radio de la caja de sombra
            spreadRadius: 2.0,  //el tanto que se va extender afuera, la extension del radius
            offset: Offset(2.0, 10.0) //es la posicion de la caja de sombra, esta recibe valores en X y Y, es decir podemos moverlo como en un plano cartesiano con coordenada en X y Y
          )
        ]
      ),
      child: ClipRRect( //nos perimite cortar cualquier cosa que este fuera del contenedor, que en este caso era las puntas de las imagenes, porque pusimos un BorderRadius
        borderRadius: BorderRadius.circular(30.0),  //ahora si respeta el borderRadius
        child: cardWithImage, //aca poenmos la tarjeta que luego lo convertimos en container para que el tamaño del container sea el mismo de la imagen
      ),
    );

  }

}
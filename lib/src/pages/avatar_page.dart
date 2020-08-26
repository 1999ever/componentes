import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        //es muy parecicido al showDialog pero esta con lista de widget
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0), //margenes a todo los lados
            child: CircleAvatar(  //crea un circulo que representa un usuario
              backgroundImage: NetworkImage('https://cdn.chapintv.com/files/2018/02/15/Messi%20-%20Barcelona-.jpg'),
              radius: 25.0, //para cambiar las dimensiones del radio del avatar
            ),
          ),

          Container( //envolvemos el CircleAvatar con un container para que me permita jugar con el circle avatar, es decir añadirles nuevas cosas
            margin: EdgeInsets.only(right: 10.0, bottom: 0.0, left: 0.0, top: 0.0), //puedo moverlo a cualquier de los 4 lados que tiene
            child: CircleAvatar(
              child: Text('ET'),  //texto de fondo cuando el usuario no tenga foto de perfil
              backgroundColor: Colors.amber,  //color de fondo del avatar
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage( //crea un widget que carga el placeholder mientras la imagen se carga del internet
          image: NetworkImage('https://picsum.photos/seed/picsum/536/354'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );

  }
  
}
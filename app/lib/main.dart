import 'package:flutter/material.dart';
import 'package:tesis/vista/inicios.dart';
import 'package:tesis/vista/registro.dart';
import 'package:tesis/vista/sobrenuble.dart';
import 'package:tesis/vista/mapa/mapa.dart';
import 'package:tesis/vista/resumenEventos.dart';
import 'package:tesis/vista/resumenPymes.dart';
import 'package:tesis/vista/registro2.dart';

void main() {
  runApp(MyApp());
}

String ip = "18.219.167.4";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ÑubleTur',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/imagenEvento.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Bienvenido a Ñuble!'),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                _bottonevento(),
                SizedBox(
                  height: 20.0,
                ),
                _bottonPyme(),
                SizedBox(
                  height: 20.0,
                ),
              ],
            )),
            drawer: menuLateral(),
          ),
        ),
        initialRoute: "/",
        routes: {
          '/menu': (context) => paginainicios(),
          '/menu2': (context) => paginaregistro(),
          '/menu3': (context) => paginasobrenuble(),
          '/menu4': (context) => paginamapa(),
          '/menu5': (context) => paginaregistro2(),
        });
  }

  Widget _bottonevento() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            child: Text(
              'Ver Eventos',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.green[600],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => paginaResumenE()),
            );
          });
    });
  }

  Widget _bottonPyme() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 44.0, vertical: 15.0),
            child: Text(
              'Ver Pymes',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.green[600],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => paginaResumenP()),
            );
          });
    });
  }
}

// ignore: camel_case_types
class menuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text(correo),
          ),
          new ListTile(
              title: Text("Iniciar Sesión"),
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              }),
          new ListTile(
              title: Text("Registrarse"),
              onTap: () {
                Navigator.pushNamed(context, '/menu2');
              }),
          new ListTile(
              title: Text("Sobre Ñuble"),
              onTap: () {
                Navigator.pushNamed(context, '/menu3');
              }),
          new ListTile(
              title: Text("Mapa"),
              onTap: () {
                Navigator.pushNamed(context, '/menu4');
              }),
          new ListTile(
              title: Text("Elegir Privilegio"),
              onTap: () {
                Navigator.pushNamed(context, '/menu5');
              }),
        ],
      ),
    );
  }
}

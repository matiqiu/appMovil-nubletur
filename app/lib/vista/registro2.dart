import 'package:flutter/material.dart';
import 'package:tesis/main.dart';
import 'package:tesis/vista/registro.dart';
import 'package:tesis/vista/registros/registroempresa.dart';
import 'package:tesis/vista/registros/registropyme.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class paginaregistro2 extends StatefulWidget {
  @override
  _paginaregistro2 createState() => new _paginaregistro2();
}

class _paginaregistro2 extends State<paginaregistro2> {
  static String idr2 = 'registro2';

  Future<List> privilegioVisita() async {
    final response = await http.post(
        "http://" +
            ip +
            "/flutter/privilegio/add_privilegio/privilegio_visitante.php",
        body: {"id_usuario": id_usuario.toString()});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  Future<List> privilegioUEventos() async {
    final response = await http.post(
        "http://" +
            ip +
            "/flutter/privilegio/add_privilegio/privilegio_evento.php",
        body: {"id_usuario": id_usuario.toString()});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => registroempresa()),
    );
  }

  Future<List> privilegioUPyme() async {
    final response = await http.post(
        "http://" +
            ip +
            "/flutter/privilegio/add_privilegio/privilegio_pyme.php",
        body: {"id_usuario": id_usuario.toString()});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => registropyme()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registro'),
        ),
        body: ListView(
          children: [
            usuariovisitante,
            textUvisitante,
            _bottonuv(),
            empresa,
            textempresa,
            _bottonempresa(),
            pyme,
            textpyme,
            _bottonpyme()
          ],
        ),
      ),
    );
  }

  Widget usuariovisitante = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Usuario Visitante',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textUvisitante = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Este es el usuario que visita la pagina'
      ' con las intenciones de conocer, opinar y compartir.',
      softWrap: true,
    ),
  );

  Widget _bottonuv() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Usuario Visitante',
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
            privilegioVisita();
          });
    });
  }

  Widget empresa = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Publicador de Eventos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textempresa = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Usuario que busca publicar eventos de las'
      ' distintas zonas de la región, tanto de'
      ' empresas publicas como privadas.',
      softWrap: true,
    ),
  );

  Widget _bottonempresa() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Publicador de Eventos',
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
            privilegioUEventos();
          });
    });
  }

  Widget pyme = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Pyme',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textpyme = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Un usuario con una Pyme que busca dar a'
      ' conocer los productos que ofrece y crear'
      ' asistencias en los eventos que participará.',
      softWrap: true,
    ),
  );

  Widget _bottonpyme() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Pyme',
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
            privilegioUPyme();
          });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'package:tesis/vista/registro.dart';
import 'package:tesis/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class registroempresa extends StatefulWidget {
  @override
  _registroempresa createState() => new _registroempresa();
}

class _registroempresa extends State<registroempresa> {
  static String idre = 'registroE';

  final telefono = TextEditingController();
  final comuna = TextEditingController();
  final localidad = TextEditingController();
  final empresa = TextEditingController();
  final rubro = TextEditingController();

  Future<List> _registroUV() async {
    final response = await http.post(
        "http://" + ip + "/flutter/usuario/add_user/add_user_eventos.php",
        body: {
          "empresa": empresa.text,
          "telefono": telefono.text,
          "comuna": comuna.text,
          "localidad": localidad.text,
          "rubro": rubro.text,
          "id": id_usuario.toString()
        });
    var datos = jsonDecode(response.body);
    if (datos[1].toString() == "Registrado Correctamente") {
      MessageWidget.info(context, datos[1].toString(), 5);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } else {
      MessageWidget.error(context, datos[1].toString(), 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro Empresa',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registro Empresa'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 15.0,
            ),
            _telefonoContacto(),
            SizedBox(
              height: 15.0,
            ),
            _comuna(),
            SizedBox(
              height: 15.0,
            ),
            _localidad(),
            SizedBox(
              height: 15.0,
            ),
            _empresa(),
            SizedBox(
              height: 15.0,
            ),
            _rubro(),
            SizedBox(
              height: 15.0,
            ),
            _bottonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _telefonoContacto() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: telefono,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.call),
            labelText: 'Telefono',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _comuna() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: comuna,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.location_on),
            labelText: 'Comuna',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _localidad() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: localidad,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.location_on),
            labelText: 'Localidad',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _empresa() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: empresa,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.apartment),
            labelText: 'Nombre Empresa',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _rubro() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: rubro,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.apartment),
            labelText: 'Rubro',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Registrarse',
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
            _registroUV();
          });
    });
  }
}

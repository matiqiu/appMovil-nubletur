import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'package:tesis/vista/registro.dart';
import 'package:tesis/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class registropyme extends StatefulWidget {
  @override
  _registropyme createState() => new _registropyme();
}

class _registropyme extends State<registropyme> {
  static String idrp = 'registroP';

  final pyme = TextEditingController();
  final telefono = TextEditingController();
  final comuna = TextEditingController();
  final localidad = TextEditingController();
  final rubro = TextEditingController();
  final descripcionP = TextEditingController();

  Future<List> _registroPyme() async {
    final response = await http.post(
        "http://" + ip + "/flutter/usuario/add_user/add_user_pyme.php",
        body: {
          "nombre_pyme": pyme.text,
          "descripcion_pyme": descripcionP.text,
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
      title: 'Registro Pyme',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registro Pyme'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 15.0,
            ),
            _pyme(),
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
            _telefonoContacto(),
            SizedBox(
              height: 15.0,
            ),
            _rubro(),
            SizedBox(
              height: 15.0,
            ),
            _descripcionP(),
            SizedBox(
              height: 15.0,
            ),
            _bottonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _pyme() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: pyme,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.apartment),
            labelText: 'Nombre Pyme',
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

  Widget _descripcionP() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: descripcionP,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.article_outlined),
            labelText: 'Descripción',
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
            _registroPyme();
          });
    });
  }
}

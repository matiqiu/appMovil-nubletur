import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'package:tesis/vista/registro2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:tesis/main.dart';
import 'package:http/http.dart' as http;

int id_usuario;

class paginaregistro extends StatefulWidget {
  @override
  _paginaregistro createState() => new _paginaregistro();
}

class _paginaregistro extends State<paginaregistro> {
  static String idr = 'registro';

  final nombre = TextEditingController();
  final usuario = TextEditingController();
  final contrasena = TextEditingController();
  final contrasenav = TextEditingController();
  var pass, pasword;

  Future<List> _registro() async {
    pasword = contrasenav.text;
    pass = contrasena.text;
    if (pass == pasword) {
      final response = await http.post(
          "http://" + ip + "/flutter/usuario/add_user/add_usuario.php",
          body: {
            "nombre": nombre.text,
            "email": usuario.text,
            "password": pass
          });
      var datos = jsonDecode(response.body);
      if (datos[1].toString() == "Registrado Correctamente") {
        MessageWidget.info(context, datos[1].toString(), 5);
        id_usuario = int.parse(datos[3]);
        MessageWidget.info(context, id_usuario.toString(), 5);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => paginaregistro2()),
        );
      } else {
        MessageWidget.error(context, datos[0].toString(), 5);
      }
    } else {
      MessageWidget.error(
          context, "Error las contraseñas deben ser iguales", 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'images/LogoDefinitivo.png',
                height: 200.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            _nameTextField(),
            SizedBox(
              height: 15.0,
            ),
            _userTextField(),
            SizedBox(
              height: 15.0,
            ),
            _passwordTextField(),
            SizedBox(
              height: 15.0,
            ),
            _passwordvTextField(),
            SizedBox(
              height: 20.0,
            ),
            _bottonLogin(),
          ],
        ),
      ),
    ));
  }

  Widget _nameTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: nombre,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.account_circle),
            hintText: 'Nombre y Apellido',
            labelText: 'Nombre y Apellido',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: usuario,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo Electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: contrasena,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordvTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: contrasenav,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Verificar Contraseña',
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
            _registro();
          });
    });
  }
}

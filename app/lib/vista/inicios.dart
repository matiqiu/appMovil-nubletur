import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:tesis/model/message/message.dart';
import 'package:tesis/main.dart';

String username = "";
String correo = "";
int id;
bool sesion = false;

class paginainicios extends StatefulWidget {
  @override
  _paginainicios createState() => new _paginainicios();
}

class _paginainicios extends State<paginainicios> {
  static String idS = 'inicios';

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future<List> _login() async {
    final response = await http.post(
        "http://" + ip + "/flutter/login/login.php",
        body: {"email": user.text, "password": pass.text});

    var datauser = json.decode(response.body);
    if (datauser[0].toString() == "resultado") {
      MessageWidget.error(context, datauser[1].toString(), 10);
    } else {
      //MessageWidget.info(
      //context, "id: " + datauser[0]['id_usuario'].toString(), 10);

      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      setState(() {
        username = datauser[0]['nombre'].toString();
        correo = datauser[0]['email'].toString();
        id = int.parse(datauser[0]['id_usuario'].toString());
      });
    }
    MessageWidget.info(context, "bienvenido al sistema " + username, 5);
    return datauser;
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
            _userTextField(),
            SizedBox(
              height: 15.0,
            ),
            _passwordTextField(),
            SizedBox(
              height: 40.0,
            ),
            _bottonLogin(),
            SizedBox(
              height: 20.0,
            ),
            /*_bottongoogle(),
            SizedBox(
              height: 20.0,
            ),*/
          ],
        ),
      ),
    ));
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: user,
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
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          controller: pass,
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

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesión',
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
            _login();
          });
    });
  }
}

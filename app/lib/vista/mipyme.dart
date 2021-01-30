import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'package:tesis/vista/productos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/main.dart';

class mipyme extends StatefulWidget {
  @override
  final idUsuario;
  mipyme(this.idUsuario);
  _mipyme createState() => new _mipyme(idUsuario);
}

class _mipyme extends State<mipyme> {
  _mipyme(this.idU);

  String nombreRP = "";
  String descripcionRP = "";
  String emailRP = "";
  String telefonoU = "";
  String rubroRP = "";
  String comunaRP = "";
  String imagenRP = "";
  int idU;

  void _mostrarRpyme() async {
    var pyme;

    final response = await http.post(
        "http://" + ip + "/flutter/pyme/select_pyme/select_pyme.php",
        body: {"id_evento": idU.toString()});
    pyme = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    if (pyme[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        idU = int.parse(pyme[0]["id_usuario"].toString());
        nombreRP = pyme[0]['nombre_pyme'].toString();
        descripcionRP = pyme[0]["descripcion_pyme"].toString();
        emailRP = pyme[0]['email'].toString();
        telefonoU = pyme[0]['telefono'].toString();
        rubroRP = pyme[0]['rubro'].toString();
        comunaRP = pyme[0]['comuna'].toString();
        imagenRP = pyme[0]["imagen_pyme"].toString();
      });
    }
    //MessageWidget.info(context, nombreRP.toString(), 5);
  }

  @override
  void initState() {
    _mostrarRpyme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            nombrePyme(),
            Image.network(
              imagenRP,
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            correoPyme(),
            telefonoPyme(),
            rubroPyme(),
            textPyme(),
            _bottonProducto()
          ],
        ),
      ),
    );
  }

  Widget nombrePyme() => Container(
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
                      nombreRP,
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

  Widget correoPyme() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "E-Mail: " + emailRP,
          softWrap: true,
        ),
      );

  Widget telefonoPyme() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Telefono: " + telefonoU,
          softWrap: true,
        ),
      );

  Widget rubroPyme() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Rubro: " + rubroRP,
          softWrap: true,
        ),
      );

  Widget comunaPyme() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Comuna: " + comunaRP,
          softWrap: true,
        ),
      );

  Widget textPyme() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          descripcionRP,
          softWrap: true,
        ),
      );

  Widget _bottonProducto() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Productos',
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
              MaterialPageRoute(builder: (context) => productos(idU)),
            );
          });
    });
  }
}

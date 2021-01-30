import 'package:flutter/material.dart';
import 'package:tesis/vista/mipyme.dart';
import 'package:tesis/model/message/message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/model/pyme/model_pyme.dart';
import 'package:tesis/main.dart';

class paginaResumenP extends StatefulWidget {
  @override
  _paginaResumenP createState() => new _paginaResumenP();
}

int max;

class _paginaResumenP extends State<paginaResumenP> {
  void conteo() async {
    var count;

    final response = await http.post(
        "http://" + ip + "/flutter/pyme/select_pyme/conteo.php",
        body: {});
    count = json.decode(response.body);
    max = int.parse(count[1].toString());
  }

  void _mostrarRpyme() async {
    nuevaPyme.clear();

    const int idU = 1;
    var pyme;

    final response = await http.post(
        "http://" + ip + "/flutter/pyme/select_pyme/select_pyme.php",
        body: {});
    pyme = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    if (pyme[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        int i = 0;
        while (i < max) {
          nuevaPyme.add(Pyme(
            idUsuario: int.parse(pyme[i]['id_usuario'].toString()),
            nombre: pyme[i]['nombre_pyme'].toString(),
            descripcion: pyme[i]['descripcion_pyme'].toString(),
            foto: pyme[i]['imagen_pyme'].toString(),
          ));
          //MessageWidget.info(context, eventoNuevo.length.toString(), 5);
          i++;
        }
      });
    }
    //MessageWidget.info(context, nombreRP.toString(), 5);
  }

  @override
  void initState() {
    conteo();
    _mostrarRpyme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Pymes',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Pymes')),
            body: new ListView(
              children: nuevaPyme.map(_buildItem).toList(),
            )));
  }

  Widget nombrePyme(String nombreRP) => Container(
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

  Widget textPyme(String descripcionRP) => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          descripcionRP,
          softWrap: true,
        ),
      );

  Widget _buildItem(Pyme py) {
    return new ListTile(
      title: nombrePyme(py.nombre),
      subtitle: textPyme(py.descripcion),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mipyme(py.idUsuario)),
        );
      },
    );
  }
}

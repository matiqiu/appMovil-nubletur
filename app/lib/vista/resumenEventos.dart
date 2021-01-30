import 'package:flutter/material.dart';
import 'package:tesis/model/evento/model_evento.dart';
import 'package:tesis/vista/evento.dart';
import 'package:tesis/model/message/message.dart';
import 'dart:convert';
import 'package:tesis/main.dart';
import 'package:http/http.dart' as http;

class paginaResumenE extends StatefulWidget {
  @override
  _paginaResumenE createState() => new _paginaResumenE();
}

int max;

class _paginaResumenE extends State<paginaResumenE> {
  void conteo() async {
    var count;

    final response = await http.post(
        "http://" + ip + "/flutter/evento/select_evento/conteo.php",
        body: {});
    count = json.decode(response.body);
    max = int.parse(count[1].toString());
  }

  void _mostrarREvento() async {
    eventoNuevo.clear();

    const int idEvento = 2;
    var evento;

    final response = await http.post(
        "http://" + ip + "/flutter/evento/select_evento/select_evento.php",
        body: {});
    evento = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    if (evento[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        //max = int.parse(evento[1][0]["MAX(id_evento)"]);
        int i = 0;
        while (i < max) {
          eventoNuevo.add(Evento(
              id: int.parse(evento[i]['id_evento'].toString()),
              nombre: evento[i]['nombre_evento'],
              descripcion: evento[i]['contenido'].toString(),
              url: evento[i]['imagen_evento'].toString()));
          //MessageWidget.info(context, eventoNuevo.length.toString(), 5);
          i++;
        }
      });
    }
  }

  @override
  void initState() {
    conteo();
    _mostrarREvento();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Eventos',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Eventos')),
            body: new ListView(
              children: eventoNuevo.map(_buildItem).toList(),
            )));
  }

  Widget nevento(String evento) => Container(
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
                      evento,
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

  Widget textevento(String descripcion) => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          descripcion,
          softWrap: true,
        ),
      );

  Widget _buildItem(Evento ev) {
    return new ListTile(
      title: nevento(ev.nombre),
      subtitle: textevento(ev.descripcion),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => paginaevento(ev.id)),
        );
      },
    );
  }
}

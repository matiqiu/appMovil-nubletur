import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/vista/inicios.dart';
import 'package:tesis/vista/comentarios.dart';
import 'package:tesis/main.dart';

class paginaevento extends StatefulWidget {
  @override
  final idEvento;
  paginaevento(this.idEvento);
  _paginaevento createState() => new _paginaevento(idEvento);
}

class _paginaevento extends State<paginaevento> {
  TextEditingController txtComentario = new TextEditingController();

  _paginaevento(this.id_evento);

  //Evento
  String nombreE = "";
  String imagen = "";
  String fechaI = "";
  String fechaT = "";
  String fechaPublicacion = "";
  String horaI = "";
  String horaT = "";
  String descripcion = "";
  String descripcion2 = "";
  String localidad = "";
  String direccion = "";
  int id_evento;

//Comentario
  String contenido = "";
  String fecha = "";
  String nombreU = "";
  int max;
  void conteo() async {
    var count;

    final response = await http.post(
        "http://" + ip + "/flutter/evento/select_evento/conteo.php",
        body: {});
    count = json.decode(response.body);
    max = int.parse(count[1].toString());
  }

  void _mostrarEvento() async {
    var evento;

    final response = await http.post(
        "http://" + ip + "/flutter/evento/select_evento/select_evento.php",
        body: {"id_evento": id_evento.toString()});
    evento = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    //MessageWidget.info(context, id_evento.toString(), 5);
    if (evento[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        id_evento = int.parse(evento[0]["id_evento"].toString());
        nombreE = evento[0]['nombre_evento'].toString();
        localidad = evento[0]["localidad"].toString();
        direccion = evento[0]["direccion"].toString();
        descripcion = evento[0]["contenido"].toString();
        descripcion2 = evento[0]["contenido2"].toString();
        fechaI = evento[0]["dia_inicio"].toString();
        fechaT = evento[0]["dia_termino"].toString();
        horaI = evento[0]["hora_inicio"].toString();
        horaT = evento[0]["hora_termino"].toString();
        imagen = evento[0]["imagen_evento"].toString();
        fechaPublicacion = evento[0]["fecha_publicacion"].toString();
      });
    }

    //MessageWidget.info(context, id_evento.toString(), 5);
  }

  void _crearComentario() async {
    var respuesta;

    final response = await http.post(
        "http://" +
            ip +
            "/flutter/comentario/add_comentario/add_comentario.php",
        body: {
          "id_usuario": id.toString(),
          "id_evento": id_evento.toString(),
          "contenido": txtComentario.text
        });
    respuesta = json.decode(response.body);
    if (respuesta[1] == "error") {
      MessageWidget.error(context, "error, no se pudo crear el comentario", 5);
    } else {
      MessageWidget.info(context, "comentario creado con éxito", 5);
    }
  }

  @override
  void initState() {
    conteo();
    _mostrarEvento();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            nombreEvento(),
            Image.network(
              imagen,
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            fechaEventoI(),
            fechaEventoT(),
            horaEventoI(),
            horaEventoT(),
            textevento(),
            textevento2(),
            _comentario(),
            _bottonComentario(),
            SizedBox(
              height: 15.0,
            ),
            _bottonComentarioV(),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget nombreEvento() => Container(
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
                      nombreE,
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

  Widget fechaEventoI() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Fecha inicio: " + fechaI,
          softWrap: true,
        ),
      );

  Widget fechaEventoT() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Fecha termino: " + fechaT,
          softWrap: true,
        ),
      );

  Widget horaEventoI() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Hora inicio: " + horaI,
          softWrap: true,
        ),
      );

  Widget horaEventoT() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Hora Termino: " + horaT,
          softWrap: true,
        ),
      );

  Widget textevento() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          descripcion,
          softWrap: true,
        ),
      );

  Widget textevento2() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          descripcion2,
          softWrap: true,
        ),
      );

  Widget _bottonComentario() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Publicar Comentarios',
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
              MaterialPageRoute(builder: (context) => comentarios(id_evento)),
            );
            _crearComentario();
          });
    });
  }

  Widget _bottonComentarioV() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Text(
              'Ver Comentarios',
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
              MaterialPageRoute(builder: (context) => comentarios(id_evento)),
            );
          });
    });
  }

  Widget _comentario() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: txtComentario,
          decoration: InputDecoration(
            icon: Icon(Icons.article_outlined),
            labelText: 'Realiza un Comentario',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }
}

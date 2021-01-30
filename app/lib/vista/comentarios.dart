import 'package:flutter/material.dart';
import 'package:tesis/model/message/message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/main.dart';
import 'package:tesis/model/comentario/model_comentario.dart';

class comentarios extends StatefulWidget {
  @override
  final idEvento;
  comentarios(this.idEvento);
  _comentarios createState() => new _comentarios(idEvento);
}

class _comentarios extends State<comentarios> {
  int id_evento;
  _comentarios(this.id_evento);

  int max;
  void conteo() async {
    var count;

    final response = await http.post(
        "http://" + ip + "/flutter/comentario/select_comentario/conteo.php",
        body: {"id_evento": id_evento.toString()});
    count = json.decode(response.body);
    max = int.parse(count[1].toString());
  }

  void _mostrarComentario() async {
    nuevoComentario.clear();
    var comentario;

    final response = await http.post(
        "http://" +
            ip +
            "/flutter/comentario/select_comentario/select_comentario.php",
        body: {"id_evento": id_evento.toString()});
    comentario = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    if (comentario[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        int i = 0;
        while (i < max) {
          nuevoComentario.add(Comentario(
              idComentario:
                  int.parse(comentario[i]['id_comentario'].toString()),
              idUsuario: int.parse(comentario[i]['id_usuario'].toString()),
              idEvento: int.parse(comentario[i]['id_evento'].toString()),
              nombreUsuario: comentario[i]['nombre'],
              contenido: comentario[i]['contenido'].toString(),
              fecha: comentario[i]['fecha']));
          //MessageWidget.info(context, eventoNuevo.length.toString(), 5);
          i++;
        }
      });
    }
    //MessageWidget.info(context, contenido, 5);
  }

  @override
  void initState() {
    conteo();
    _mostrarComentario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: nuevoComentario.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget nombreUsuarioF(String nombreU, String fecha) => Container(
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
                      nombreU + " " + fecha,
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

  Widget comentariosC(String contenido) => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          contenido,
          softWrap: true,
        ),
      );

  Widget _buildItem(Comentario com) {
    return new ListTile(
      title: nombreUsuarioF(com.nombreUsuario, com.fecha),
      subtitle: comentariosC(com.contenido),
      onTap: () {},
    );
  }
}

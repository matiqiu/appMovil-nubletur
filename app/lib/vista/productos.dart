import 'package:flutter/material.dart';
import 'package:tesis/main.dart';
import 'package:tesis/model/message/message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tesis/vista/resumenEventos.dart';
import 'package:tesis/model/producto/model_producto.dart';

class productos extends StatefulWidget {
  @override
  final idUsuario;
  productos(this.idUsuario);
  _productos createState() => new _productos(idUsuario);
}

class _productos extends State<productos> {
  _productos(this.idU);

  void conteo() async {
    var count;

    final response = await http.post(
        "http://" + ip + "/flutter/producto/select_producto/conteo.php",
        body: {"id_usuario": idU.toString()});
    count = json.decode(response.body);
    max = int.parse(count[1].toString());
  }

  int idU;

  void _mostrarPpyme() async {
    nuevoProducto.clear();
    var producto;

    final response = await http.post(
        "http://" +
            ip +
            "/flutter/producto/select_producto/select_producto.php",
        body: {"id_usuario": idU.toString()});
    producto = json.decode(response.body);
    /* else {
      MessageWidget.error(context, "Error la ID no debe ser Nula", 5);
    }*/
    if (producto[0].toString() == "resultado") {
      MessageWidget.error(context, "Error de Conexión", 5);
    } else {
      setState(() {
        int i = 0;
        while (i < max) {
          nuevoProducto.add(Producto(
            idUsuario: int.parse(producto[i]['id_usuario'].toString()),
            idProducto: int.parse(producto[i]['id_producto'].toString()),
            nombre: producto[i]['nombre'].toString(),
            precio: producto[i]['precio'].toString(),
            descripcion: producto[i]['descripcion'].toString(),
          ));
          i++;
        }
      });
    }
    //MessageWidget.info(context, nombreRP.toString(), 5);
  }

  @override
  void initState() {
    _mostrarPpyme();
    conteo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: nuevoProducto.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget nombreProducto(String nombreP, String precioP) => Container(
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
                      nombreP + " Precio: " + precioP + ' pesos',
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

  Widget descripcionProducto(String descripcionP) => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Descripción: " + descripcionP,
          softWrap: true,
        ),
      );

  Widget _buildItem(Producto p) {
    return new ListTile(
      title: nombreProducto(p.nombre, p.precio),
      subtitle: descripcionProducto(p.descripcion),
      onTap: () {},
    );
  }
}

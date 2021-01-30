class Producto {
  final int idUsuario;
  final int idProducto;
  final String nombre;
  final String precio;
  final String descripcion;

  const Producto(
      {this.idUsuario,
      this.idProducto,
      this.nombre,
      this.precio,
      this.descripcion});
}

List<Producto> nuevoProducto = [];

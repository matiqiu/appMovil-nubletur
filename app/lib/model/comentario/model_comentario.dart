class Comentario {
  final int idComentario;
  final int idUsuario;
  final int idEvento;
  final String contenido;
  final String nombreUsuario;
  final String fecha;
  const Comentario(
      {this.idComentario,
      this.idUsuario,
      this.idEvento,
      this.nombreUsuario,
      this.contenido,
      this.fecha});
}

List<Comentario> nuevoComentario = [];

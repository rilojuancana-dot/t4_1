class Producto {
  final String nombre;
  final double precio;
  int cantidad;

  Producto(this.nombre, this.precio, this.cantidad);
  
  /// Convierte el objeto [Producto] a [String].
  @override
  String toString() {
    return "$nombre, Precio $precio, Cantidad $cantidad";
  }
}
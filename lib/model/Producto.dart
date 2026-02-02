class Producto {
  final String nombre;
  final double precio;
  int cantidad;

  Producto(this.nombre, this.precio, this.cantidad);
  
  @override
  String toString() {
    // TODO: implement toString
    return "$nombre, Precio $precio, Cantidad $cantidad";
  }
}
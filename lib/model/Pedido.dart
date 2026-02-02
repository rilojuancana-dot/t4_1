import 'package:t4_1/model/Producto.dart';

class Pedido {
  int id;
  List<Producto> productos = List.empty(growable: true);
  late double _precioTotal;

  double get precioTotal {
    actualizarTotal();
    return _precioTotal;
  }

  Pedido(this.id, this.productos){
    _precioTotal = 0;
    actualizarTotal();
  }

  void actualizarTotal(){
    _precioTotal = 0;
    for (var producto in productos){
      _precioTotal += producto.cantidad * producto.precio;
    }
  }

  int numeroProductos(){
    return productos.length;
  }

  void addProducto(Producto p){
    if (!productos.contains(p)){
      productos.add(p);
    }
    else{
      for (var producto in productos) {
        if (producto == p) {
          producto.cantidad++;
          continue;
        }
      }
    }
  }
}
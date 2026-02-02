import 'package:t4_1/model/Producto.dart';

/// Modelo que representa un pedido, que contiene una lista de [Producto] y calcula el precio total del pedido.
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

/// Actualiza el precio total del pedido sumando el precio de cada producto multiplicado por su cantidad.
  void actualizarTotal(){
    _precioTotal = 0;
    for (var producto in productos){
      _precioTotal += producto.cantidad * producto.precio;
    }
  }

/// Devuelve el número de productos en el pedido.
  int numeroProductos(){
    return productos.length;
  }

/// Añade un [Producto] al pedido. Si el producto ya existe en el pedido, incrementa su cantidad.
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
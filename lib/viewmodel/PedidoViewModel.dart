import 'package:flutter/material.dart';
import 'package:t4_1/model/Pedido.dart';
import 'package:t4_1/model/Producto.dart';


/// Gestiona la lista de Pedidos, proporcionando métodos para acceder y modificar los datos y notificar a la vista sobre los cambios.
class PedidoViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [
      Pedido(1, [
        Producto("Laptop", 999.99, 1),
        Producto("Mouse", 29.99, 2),
        Producto("Teclado", 79.99, 1),
      ]),
      Pedido(2, [
        Producto("Smartphone", 699.99, 1),
        Producto("Funda", 19.99, 1),
        Producto("Cargador", 39.99, 2),
      ]),
      Pedido(3, [
        Producto("Tablet", 349.99, 1),
        Producto("Stylus", 49.99, 1),
      ]),
      Pedido(4, [
        Producto("Auriculares", 129.99, 1),
        Producto("Adaptador", 15.99, 3),
      ]),
      Pedido(5, [
        Producto("Monitor", 299.99, 2),
        Producto("Cable HDMI", 12.99, 1),
      ]),
    ];

  List<Pedido> get pedidos => _pedidos;

  
  /// Añade un nuevo pedido a la lista de pedidos.
  void addPedido(Pedido? p){
    if (p == null) return;
    _pedidos.add(p);
    notifyListeners();
  }

}
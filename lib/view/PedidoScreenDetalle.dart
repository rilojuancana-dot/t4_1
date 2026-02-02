
import 'package:flutter/material.dart';
import 'package:t4_1/model/Pedido.dart';

class Pedidoscreendetalle extends StatelessWidget{
  final Pedido pedido;

  const Pedidoscreendetalle({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: 
                ListView.builder(
                  itemCount: pedido.productos.length,
                  itemBuilder: (context, index){
                    final producto = pedido.productos[index];
                    return Card(
                      child: Text("${producto.nombre}, Precio: ${producto.precio}, Cantidad : ${producto.cantidad}"),
                    );
                  },
                )
            ),
            Text("Total Pedido: ${pedido.precioTotal} €"),
            ElevatedButton(onPressed:() => Navigator.pop(context), child: Text("Volver"))
          ]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:t4_1/model/Pedido.dart';
import 'package:t4_1/view/PedidoScreen.dart';
import 'package:t4_1/viewmodel/PedidoViewModel.dart';


/// Pantalla principal que muestra la lista de pedidos y permite añadir nuevos pedidos. Esta pantalla interactúa con el PedidoViewModel para gestionar los datos.
class Home extends StatefulWidget {
  static const routeName = '/';
  final PedidoViewModel viewModel;
  const Home({super.key, required this.viewModel});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.viewModel.pedidos.length,
            itemBuilder: (context, index) {
              final pedido = widget.viewModel.pedidos[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Nombre de la mesa: ${pedido.id}"),
                  subtitle: Text("Número de productos: ${pedido.productos.length}"),
                  trailing: Text("Precio Total: ${pedido.precioTotal.toStringAsFixed(2)}€"),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final pedidofuture = await Navigator.pushNamed<Pedido?>(
              context, PedidoScreen.routeName,
            );
            if (!mounted) return;
            setState(() => widget.viewModel.addPedido(pedidofuture));
          }, 
          child: Text("Añadir producto")
        )
      ],
    );
  }
}
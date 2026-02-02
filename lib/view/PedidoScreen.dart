import 'package:flutter/material.dart';
import 'package:t4_1/model/Pedido.dart';
import 'package:t4_1/model/Producto.dart';
import 'package:t4_1/view/PedidoScreenDetalle.dart';
import 'package:t4_1/view/ProductoScreen.dart';


/// Pantalla para crear y gestionar un nuevo pedido. Permite añadir productos, ver el detalle del pedido y guardar o cancelar el pedido.
class PedidoScreen extends StatefulWidget {
  static const routeName = '/pedido';
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreen();
}

class _PedidoScreen extends State<PedidoScreen>{
  late Pedido nuevoPedido;
  late int id;
  @override
  void initState() {
    super.initState();
    nuevoPedido = Pedido(0, []);
    id = 0;
  }

  @override
  Widget build(BuildContext context) {
     final TextEditingController _idController = TextEditingController();
    

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: 
                ListView.builder(
                  itemCount: nuevoPedido.productos.length,
                  itemBuilder: (context, index){
                    final producto = nuevoPedido.productos[index];
                    return Card(
                      child: Text("${producto.nombre}, Precio: ${producto.precio}, Cantidad : ${producto.cantidad}"),
                    );
                  },
                )
            ),
            
            Text("Total Pedido: ${nuevoPedido.precioTotal} €"),
            
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                final numero = int.tryParse(value);
                if (numero == null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Solo se permiten números'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Entendido'),
                        ),
                      ],
                    ),
                  );
                } else {
                  id = numero;
                }
              },
            ),
            /// Botón para añadir productos al pedido, resultado de navegar a la pantalla de selección de productos. Al volver, se añaden los productos seleccionados 
            /// al pedido actual atendiendo a la gestión del estado.
            ElevatedButton(onPressed: ()async {
              final producto = await Navigator.pushNamed<List<Producto>?>(
                context, ProductoScreen.routeName,
              );
              
              if (!mounted) return;
              if (producto != null && producto.isNotEmpty) {
                setState(() {
                  List<Producto> auxiliar = List.empty(growable: true);
                  auxiliar.addAll(nuevoPedido.productos);
                  auxiliar.addAll(producto);
                  nuevoPedido.productos = auxiliar;
                });
              }
            }, 
            child: Text("Añadir productos al pedido")),
            ElevatedButton(
              onPressed: () {
                if (nuevoPedido.productos.isEmpty){
                  Navigator.pop(context);
                }
                else{
                  if (id != 0){
                    nuevoPedido.id = id;
                    Navigator.pop(context, nuevoPedido);
                  }
                  else{
                    showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Introduzca un id válido'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Entendido'),
                        ),
                      ],
                    ),);
                  }
                }
              },
              child: Text('Guardar pedido'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Pedidoscreendetalle(pedido: nuevoPedido)));
            },
            child: Text("Ver detalle")),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancelar")),
          ]
        )
    );
  }
}
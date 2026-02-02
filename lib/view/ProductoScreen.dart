import 'package:flutter/material.dart';
import 'package:t4_1/model/Producto.dart';


/// Pantalla para seleccionar [Producto] y añadirlos a un [Pedido].
class ProductoScreen extends StatelessWidget{
  static const routeName = '/producto';

  @override
  Widget build(BuildContext context) {
    List<Producto> productos = List.empty(growable: true);
    List<Producto> opciones = List<Producto>.of([
      Producto('Cerveza Artesanal IPA', 12000.0, 1),
      Producto('Cóctel Mojito Clásico', 18000.0, 1),
      Producto('Tabla de Quesos y Embutidos', 25000.0, 1),
      Producto('Hamburguesa BBQ del Bar', 22000.0, 1),
      Producto('Shot de Tequila Premium', 8000.0, 1),
      Producto('Refresco de Limón Natural', 6000.0, 1),
    ]);
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: 
                ListView.builder(
                  itemCount: opciones.length,
                  itemBuilder: (context, index) {
                    final producto = opciones[index];
                    return Row(
                      children: [
                        Card(
                          margin: EdgeInsets.all(8),
                          child: Text("${producto.nombre}, ${producto.precio}"),
                        ),
                        Tooltip(
                          message: 'Añadir producto',
                          child: ElevatedButton(
                            onPressed: () {
                              if (productos.contains(producto)){
                                productos.forEach((element) {
                                  if (element == producto) element.cantidad++;
                                },);
                              }
                              else{
                                productos.add(producto);
                              }
                            }, 
                            child: Text("+")
                          ),
                        ),
                        Tooltip(
                          message: "Quitar producto",
                          child: ElevatedButton(
                            onPressed: () {
                              if (productos.contains(producto)){
                                if (producto.cantidad > 0){
                                  producto.cantidad--;
                                }
                              }
                            }, 
                            child: Text("-", )
                          )
                        )
                      ],
                    );
                  }
                ),
           ),
            ElevatedButton(
              onPressed: () {
                
                Navigator.pop(context, productos);
              },
              child: Text('Confirmar'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancelar"))
          ],
          
        );
  }
}
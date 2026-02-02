import 'package:flutter/material.dart';
import 'package:t4_1/model/Pedido.dart';
import 'package:t4_1/model/Producto.dart';
import 'package:t4_1/view/HomeScreen.dart';
import 'package:t4_1/view/PedidoScreen.dart';
import 'package:t4_1/view/ProductoScreen.dart';
import 'package:t4_1/viewmodel/PedidoViewModel.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pedidoviewModel = PedidoViewModel();
    return MaterialApp(
      title: "Gestión pedidos",
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (_) => Home(viewModel: pedidoviewModel),
      },
      onGenerateRoute: (settings){
        if (settings.name == PedidoScreen.routeName){
          return MaterialPageRoute<Pedido?>(
            builder: (context) => PedidoScreen(),
            settings: settings,
          );
        }
        if (settings.name == ProductoScreen.routeName){
          return MaterialPageRoute<List<Producto>?>(
            builder: (context) => ProductoScreen(),
            settings: settings,
          );
        }
        else return null;
      },
       onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}


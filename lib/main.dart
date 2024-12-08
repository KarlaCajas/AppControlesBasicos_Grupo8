import 'package:flutter/material.dart';
import 'package:tercera_app/pantalla/ menu_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MenuPrincipal(),
    );
  }
}

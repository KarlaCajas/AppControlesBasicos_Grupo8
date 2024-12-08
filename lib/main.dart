import 'package:flutter/material.dart';
import 'package:tercera_app/pantalla/bienvenida.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tercera App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: PortadaScreen(),
    );
  }
}

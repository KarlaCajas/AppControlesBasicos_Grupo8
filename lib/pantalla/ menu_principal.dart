import 'package:flutter/material.dart';
import 'package:tercera_app/pantalla/ejercicio1_screen.dart';
import 'package:tercera_app/pantalla/ ejercicio2_screen.dart';
import 'package:tercera_app/pantalla/ ejercicio3_screen.dart';
import 'package:tercera_app/pantalla/ejercicio4_screen.dart';
import 'package:tercera_app/pantalla/ejercicio5_screen.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con un degradado de color blanco y palo de rosa
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFFADCD9), // Palo de rosa claro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              _tituloBienvenida(),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _crearBoton(context, "EJERCICIO 1", Icons.code, Ejercicio1Screen()),
                    SizedBox(height: 10),
                    _crearBoton(context, "EJERCICIO 2", Icons.calculate, Ejercicio2Screen()),
                    SizedBox(height: 10),
                    _crearBoton(context, "EJERCICIO 3", Icons.fact_check, Ejercicio3Screen()),
                    SizedBox(height: 10),
                    _crearBoton(context, "EJERCICIO 4", Icons.functions, Ejercicio4Screen()),
                    SizedBox(height: 10),
                    _crearBoton(context, "EJERCICIO 5", Icons.straighten, Ejercicio5Screen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para el título de bienvenida
  Widget _tituloBienvenida() {
    return Text(
      "¡Bienvenido!\nEscoge uno para continuar",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFB5838D), // Rosado bajo
      ),
    );
  }

  // Widget para crear botones con texto negro y un efecto hover
  Widget _crearBoton(BuildContext context, String texto, IconData icono, Widget pantalla) {
    return _BotonMorado(
      texto: texto,
      icono: icono,
      pantalla: pantalla,
    );
  }
}

// Clase personalizada para el botón con el efecto hover
class _BotonMorado extends StatefulWidget {
  final String texto;
  final IconData icono;
  final Widget pantalla;

  const _BotonMorado({
    Key? key,
    required this.texto,
    required this.icono,
    required this.pantalla,
  }) : super(key: key);

  @override
  _BotonMoradoState createState() => _BotonMoradoState();
}

class _BotonMoradoState extends State<_BotonMorado> {
  bool _isHovering = false; // Determina si el mouse está sobre el botón

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.pantalla),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovering
                  ? [Color(0xFFF5DEB3), Color(0xFFD8BFD8)] // Beige claro en hover
                  : [Color(0xFFD8BFD8), Color(0xFFD8BFD8)], // Morado claro por defecto
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icono,
                size: 30,
                color: Colors.black, // Ícono negro
              ),
              SizedBox(width: 10),
              Text(
                widget.texto,
                style: TextStyle(
                  color: Colors.black, // Texto negro
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
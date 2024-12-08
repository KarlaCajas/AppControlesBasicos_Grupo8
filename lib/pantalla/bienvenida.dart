import 'package:flutter/material.dart';
import 'package:tercera_app/pantalla/ menu_principal.dart';

class PortadaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFFADCD9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "UNIVERSIDAD DE LAS FUERZAS\nARMADAS\nESPE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB5838D), // Rosado bajo
                ),
              ),
              SizedBox(height: 10),
              Text(
                "APLICACIONES MÓVILES\nDANNY QUINGALUISA\n&\nKARLA CAJAS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              // Botón para ir al menú principal
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD8BFD8), // Color morado claro
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPrincipal()),
                  );
                },
                child: Text(
                  "IR AL MENÚ PRINCIPAL",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Texto en negrita
                    color: Colors.black, // Color negro
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../logica/logica.dart';

class Ejercicio2Screen extends StatefulWidget {
  @override
  _Ejercicio2ScreenState createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  final Logica logica = Logica();
  final TextEditingController _controller = TextEditingController();
  int? _numero;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFADCD9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _crearEncabezado(),
              SizedBox(height: 20),
              _crearCampoDeTexto(),
              SizedBox(height: 20),
              _crearTextoResultado(),
              SizedBox(height: 20),
              _crearBotonCalcular(),
              SizedBox(height: 20),
              _crearBotonRegresar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearEncabezado() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.calculate,
          size: 40,
          color: Color(0xFFB5838D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Ejercicio 2: Factorial",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB5838D),
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearCampoDeTexto() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Ingrese un número",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _crearTextoResultado() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        _resultado.isEmpty ? "Ingrese un número para calcular su factorial" : _resultado,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _crearBotonCalcular() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          try {
            final numeroIngresado = int.parse(_controller.text);

            // Validar si el número es negativo
            if (numeroIngresado < 0) {
              _resultado = "¡El número no puede ser negativo para calcular el factorial!";
            } else {
              _resultado = 'El factorial de $numeroIngresado es: ${logica.calcularFactorial(numeroIngresado)}';
            }
          } catch (e) {
            _resultado = "Por favor, ingrese un número válido";
          }
        });
      },
      child: Text(
        "Calcular Factorial",
      ),
    );
  }

  Widget _crearBotonRegresar(BuildContext context) {
    return _BotonMorado(
      texto: "Regresar al Menú",
      icono: Icons.arrow_back,
      onPressed: () => Navigator.pop(context),
    );
  }
}

class _BotonMorado extends StatefulWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onPressed;

  const _BotonMorado({
    Key? key,
    required this.texto,
    required this.icono,
    required this.onPressed,
  }) : super(key: key);

  @override
  _BotonMoradoState createState() => _BotonMoradoState();
}

class _BotonMoradoState extends State<_BotonMorado> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
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
                  ? [Color(0xFFF5DEB3), Color(0xFFD8BFD8)]
                  : [Color(0xFFD8BFD8), Color(0xFFD8BFD8)],
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
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                widget.texto,
                style: TextStyle(
                  color: Colors.black,
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
import 'package:flutter/material.dart';
import '../logica/logica.dart';

class Ejercicio3Screen extends StatefulWidget {
  @override
  _Ejercicio3ScreenState createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final Logica logica = Logica();
  final TextEditingController _controladorA = TextEditingController();
  final TextEditingController _controladorB = TextEditingController();
  int? resultado;

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                _tituloBienvenida(),
                SizedBox(height: 20),
                _crearCampoTexto(
                  _controladorA,
                  'Número A',
                  TextInputType.number,
                ),
                SizedBox(height: 10),
                _crearCampoTexto(
                  _controladorB,
                  'Número B',
                  TextInputType.number,
                ),
                SizedBox(height: 20),
                _crearBotonCalcular(context),
                SizedBox(height: 10),
                if (resultado != null)
                  Text(
                    'El MCD es: $resultado',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                Spacer(),
                _crearBotonRegresar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _tituloBienvenida() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.fact_check,
          size: 40,
          color: Color(0xFFB5838D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Ejercicio 3: Calcular MCD",
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


  Widget _crearCampoTexto(
      TextEditingController controlador, String etiqueta, TextInputType teclado) {
    return TextField(
      controller: controlador,
      keyboardType: teclado,
      decoration: InputDecoration(
        labelText: etiqueta,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    );
  }


  Widget _crearBotonCalcular(BuildContext context) {
    return _BotonMorado(
      texto: "Calcular",
      icono: Icons.calculate,
      onPressed: () {
        if (_validarCampos()) {
          setState(() {
            resultado = logica.calcularMCD(
              int.parse(_controladorA.text),
              int.parse(_controladorB.text),
            );
          });
        }
      },
    );
  }


  Widget _crearBotonRegresar(BuildContext context) {
    return _BotonMorado(
      texto: "Regresar al Menú",
      icono: Icons.arrow_back,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  // Validación de campos
  bool _validarCampos() {
    if (_controladorA.text.isEmpty || _controladorB.text.isEmpty) {
      _mostrarMensajeError('Por favor ingrese ambos números');
      return false;
    }

    final numA = int.tryParse(_controladorA.text);
    final numB = int.tryParse(_controladorB.text);

    if (numA == null || numB == null || numA <= 0 || numB <= 0) {
      _mostrarMensajeError('Por favor ingrese números válidos mayores a 0');
      return false;
    }

    return true;
  }

  // Función para mostrar mensajes de error
  void _mostrarMensajeError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

// Clase personalizada para el botón con diseño y efecto hover
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

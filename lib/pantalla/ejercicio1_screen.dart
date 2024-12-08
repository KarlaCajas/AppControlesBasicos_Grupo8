import 'package:flutter/material.dart';
import '../logica/logica.dart';

class Ejercicio1Screen extends StatelessWidget {
  final Logica logica = Logica();
  late final List<String> resultados = logica.obtenerTablaASCII();

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
            children: [
              SizedBox(height: 20),
              _tituloBienvenida(),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: resultados.length, // Mostrar todos los elementos (256)
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          resultados[index],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              _crearBoton(context, "Regresar al Menú", Icons.arrow_back),
            ],
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
          Icons.code,
          size: 40,
          color: Color(0xFFB5838D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Ejercicio 1: Mostrar tabla ASCII",
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


  Widget _crearBoton(BuildContext context, String texto, IconData icono) {
    return _BotonMorado(
      texto: texto,
      icono: icono,
      pantalla: null,
      onPressed: () => Navigator.pop(context),
    );
  }
}


class _BotonMorado extends StatefulWidget {
  final String texto;
  final IconData icono;
  final Widget? pantalla;
  final VoidCallback onPressed;

  const _BotonMorado({
    Key? key,
    required this.texto,
    required this.icono,
    this.pantalla,
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

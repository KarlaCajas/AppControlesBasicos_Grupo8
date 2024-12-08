import 'package:flutter/material.dart';
import '../logica/logica.dart';

class Ejercicio4Screen extends StatefulWidget {
  @override
  _Ejercicio4ScreenState createState() => _Ejercicio4ScreenState();
}

class _Ejercicio4ScreenState extends State<Ejercicio4Screen> {
  final Logica logica = Logica();
  final TextEditingController _controlador = TextEditingController();
  List<String>? resultado;
  String? errorTexto;

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
                TextField(
                  controller: _controlador,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ingrese un número',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
                SizedBox(height: 10),
                _crearBotonFactorizar(context),
                if (errorTexto != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorTexto!,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                SizedBox(height: 10),
                if (resultado != null)
                  Expanded(
                    child: ListView.builder(
                      itemCount: resultado!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(resultado![index]),
                      ),
                    ),
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
          Icons.functions,
          size: 40,
          color: Color(0xFFB5838D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Ejercicio 4: Factorizar un Número",
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


  Widget _crearBotonFactorizar(BuildContext context) {
    return _BotonMorado(
      texto: "Factorizar",
      icono: Icons.calculate,
      onPressed: () {
        final inputText = _controlador.text.trim();
        if (inputText.isEmpty) {
          setState(() {
            errorTexto = "Por favor, ingrese un número.";
            resultado = null;
          });
          return;
        }

        final numero = int.tryParse(inputText);
        if (numero == null) {
          setState(() {
            errorTexto = "Por favor, ingrese un número válido.";
            resultado = null;
          });
          return;
        }

        if (numero <= 1) {
          setState(() {
            errorTexto = "El número debe ser mayor que 1.";
            resultado = null;
          });
          return;
        }

        setState(() {
          errorTexto = null;
          resultado = logica.factorizarNumero(numero);
        });
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

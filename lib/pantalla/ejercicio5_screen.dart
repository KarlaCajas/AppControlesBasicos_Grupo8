import 'package:flutter/material.dart';

// Función para calcular números primos
List<int> obtenerNumerosPrimosHasta(int limite) {
  List<bool> esPrimo = List<bool>.filled(limite + 1, true);
  esPrimo[0] = false;
  esPrimo[1] = false;

  for (int i = 2; i * i <= limite; i++) {
    if (esPrimo[i]) {
      for (int j = i * i; j <= limite; j += i) {
        esPrimo[j] = false;
      }
    }
  }

  List<int> numerosPrimos = [];
  for (int i = 2; i <= limite; i++) {
    if (esPrimo[i]) {
      numerosPrimos.add(i);
    }
  }

  return numerosPrimos;
}

class Ejercicio5Screen extends StatefulWidget {
  @override
  _Ejercicio5ScreenState createState() => _Ejercicio5ScreenState();
}

class _Ejercicio5ScreenState extends State<Ejercicio5Screen> {
  List<int>? numerosPrimos;
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarNumerosPrimos();
  }

  // Función para cargar números primos
  void cargarNumerosPrimos() {
    List<int> resultado = obtenerNumerosPrimosHasta(32767);
    setState(() {
      numerosPrimos = resultado;
      cargando = false;
    });
  }

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
                _crearBotonCargarNumeros(context),
                SizedBox(height: 20), // Espacio adicional entre el botón y los números
                cargando
                    ? Center(child: CircularProgressIndicator())
                    : Expanded( // Aquí el GridView ocupa el espacio restante
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Número de columnas
                      crossAxisSpacing: 10, // Espaciado horizontal
                      mainAxisSpacing: 10, // Espaciado vertical
                      childAspectRatio: 2, // Relación de aspecto (ancho/alto)
                    ),
                    itemCount: numerosPrimos!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          "${numerosPrimos![index]}",
                          style: TextStyle(fontSize: 14), // Ajusté el tamaño del texto
                        ),
                      );
                    },
                  ),
                ),
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
          Icons.straighten,
          size: 40,
          color: Color(0xFFB5838D),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "Ejercicio 5: Mostrar Números Primos",
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


  Widget _crearBotonRegresar(BuildContext context) {
    return _BotonMorado(
      texto: "Regresar al Menú",
      icono: Icons.arrow_back,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }


  Widget _crearBotonCargarNumeros(BuildContext context) {
    return _BotonMorado(
      texto: "Cargar Números Primos",
      icono: Icons.refresh,
      onPressed: () {
        setState(() {
          cargando = true;
        });
        cargarNumerosPrimos();
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

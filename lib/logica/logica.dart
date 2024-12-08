class Logica {
  // Ejercicio 1: Mostrar tabla ASCII
  List<String> obtenerTablaASCII() {
    List<String> resultados = [];
    for (int n = 0; n <= 255; n++) {
      resultados.add('$n = ${String.fromCharCode(n)}');
      if (n % 23 == 0 && n != 0) {
        resultados.add("\n- Pulse una tecla para continuar...");
      }
    }
    return resultados;
  }

  // Ejercicio 2: Calcular factorial
  double calcularFactorial(int numero) {
    if (numero < 0) {
      throw ArgumentError("El factorial no está definido para números negativos.");
    }
    double factorial = 1;
    for (int i = 1; i <= numero; i++) {
      factorial *= i;
    }
    return factorial;
  }

  // Ejercicio 3: Calcular MCD
  int calcularMCD(int a, int b) {
    while (a != b) {
      if (a > b) {
        a -= b;
      } else {
        b -= a;
      }
    }
    return a;
  }

  // Ejercicio 4: Factorizar un número
  List<String> factorizarNumero(int numero) {
    List<String> factores = [];
    if (numero <= 1) {
      factores.add("El número debe ser mayor que 1.");
      return factores;
    }
    int factor = 2;
    while (numero > 1) {
      int potencia = 0;
      while (numero % factor == 0) {
        potencia++;
        numero ~/= factor;
      }
      if (potencia > 0) {
        factores.add("Factor $factor elevado a la potencia $potencia");
      }
      factor++;
    }
    return factores;
  }

  // Ejercicio 5: Mostrar números primos
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
}

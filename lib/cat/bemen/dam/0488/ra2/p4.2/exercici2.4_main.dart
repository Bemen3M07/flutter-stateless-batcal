import 'package:flutter/material.dart';
import 'dart:math'; // Necesario para generar números aleatorios

// --- AÑADIDO: Función main para poder ejecutar la app ---
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Opcional: quita la etiqueta "Debug"
    home: DiceRollerApp(),
  ));
}
// --------------------------------------------------------

class DiceRollerApp extends StatefulWidget {
  const DiceRollerApp({super.key});

  @override
  State<DiceRollerApp> createState() => _DiceRollerAppState();
}

class _DiceRollerAppState extends State<DiceRollerApp> {
  // Estado: valor de los dos dados (inician en 1)
  int _dado1 = 1;
  int _dado2 = 1;

  // Generador de aleatorios
  final Random _random = Random();

  // Mapa de imágenes: Asocia el número con la ruta del archivo PNG
  // Asegúrate de que estos nombres coinciden EXACTAMENTE con tus archivos en assets/images/
  final Map<int, String> _imagenesDados = {
    1: 'assets/images/uno.png',
    2: 'assets/images/dos.png',
    3: 'assets/images/tres.png',
    4: 'assets/images/cuatro.png',
    5: 'assets/images/cinco.png',
    6: 'assets/images/seis.png',
  };

  // Función para lanzar los dados
  void _lanzarDados() {
    // 1. Generar números del 1 al 6
    int nuevoDado1 = _random.nextInt(6) + 1;
    int nuevoDado2 = _random.nextInt(6) + 1;

    // 2. Actualizar el estado para cambiar las imágenes
    setState(() {
      _dado1 = nuevoDado1;
      _dado2 = nuevoDado2;
    });

    // 3. Comprobar si hay JACKPOT (Doble 6)
    if (nuevoDado1 == 6 && nuevoDado2 == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡JACKPOT! Doble seis', textAlign: TextAlign.center),
          backgroundColor: Colors.amber,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo de pantalla (Tapestry)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tapestry.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título
              const Text(
                'Gambling',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent, // Color similar a la imagen
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Fila con los dos dados
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Usamos un contenedor con sombra para que los dados resalten sobre el tapete
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(5, 5))]
                    ),
                    child: Image.asset(_imagenesDados[_dado1]!, width: 120, height: 120),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(5, 5))]
                    ),
                    child: Image.asset(_imagenesDados[_dado2]!, width: 120, height: 120),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              // Botón "ROLL THE DICE"
              ElevatedButton(
                onPressed: _lanzarDados,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5), // Azul oscuro
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'ROLL THE DICE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
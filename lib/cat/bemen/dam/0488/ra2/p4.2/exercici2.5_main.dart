import 'package:flutter/material.dart'; // Paquete base de widgets

void main() { // Punto de entrada
  runApp(const MyApp()); // Lanza la app raíz
}

class MyApp extends StatelessWidget { // Widget sin estado
  const MyApp({super.key}); // Constructor constante

  @override
  Widget build(BuildContext context) { // Configura la app
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta etiqueta debug
      home: ScoreBoard(), // Pantalla inicial
    );
  }
}

class ScoreBoard extends StatefulWidget { // Widget con estado
  @override
  State<ScoreBoard> createState() => _ScoreBoardState(); // Crea el estado
}

class _ScoreBoardState extends State<ScoreBoard> { // Estado mutable
  int scoreLeft = 0; // Marcador lado izquierdo
  int scoreRight = 0; // Marcador lado derecho

  @override
  Widget build(BuildContext context) { // Dibuja la UI
    return Scaffold(
      body: SafeArea( // Evita zonas no seguras
        child: Column(
          children: [
            // --- PART SUPERIOR: MARCADOR ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacio uniforme
              children: [
                Text(
                  "$scoreLeft", // Muestra marcador izquierdo
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$scoreRight", // Muestra marcador derecho
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 40), // Separación vertical

            // --- BOTONS SCORE ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() => scoreLeft++); // Incrementa izquierda
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF465A7C), // Color base
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: const StadiumBorder(), // Bordes redondeados
                  ),
                  child: const Text("Score",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => scoreRight++); // Incrementa derecha
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF465A7C),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Score",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

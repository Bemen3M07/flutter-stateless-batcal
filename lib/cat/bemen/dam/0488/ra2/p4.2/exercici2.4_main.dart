import 'package:flutter/material.dart'; // Widgets y estilos de Flutter
import 'dart:math'; // Generador de números aleatorios

// --- AÑADIDO: Función main para poder ejecutar la app ---
void main() { // Punto de entrada del programa
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Oculta la cinta "Debug"
    home: DiceRollerApp(), // Muestra la pantalla de dados
  ));
}
// --------------------------------------------------------

class DiceRollerApp extends StatefulWidget { // Widget con estado para el juego
  const DiceRollerApp({super.key}); // Constructor constante

  @override
  State<DiceRollerApp> createState() => _DiceRollerAppState(); // Crea estado asociado
}

class _DiceRollerAppState extends State<DiceRollerApp> { // Lógica del widget
  // Estado: valor de los dos dados (inician en 1)
  int _dado1 = 1; // Valor actual del dado izquierdo
  int _dado2 = 1; // Valor actual del dado derecho

  // Generador de aleatorios
  final Random _random = Random(); // Instancia para números aleatorios

  // Mapa de imágenes: Asocia el número con la ruta del archivo PNG
  // Asegúrate de que estos nombres coinciden EXACTAMENTE con tus archivos en assets/images/
  final Map<int, String> _imagenesDados = { // Mapea valores a imágenes
    1: 'assets/images/uno.png', // Ruta para el uno
    2: 'assets/images/dos.png', // Ruta para el dos
    3: 'assets/images/tres.png', // Ruta para el tres
    4: 'assets/images/cuatro.png', // Ruta para el cuatro
    5: 'assets/images/cinco.png', // Ruta para el cinco
    6: 'assets/images/seis.png', // Ruta para el seis
  };

  // Función para lanzar los dados
  void _lanzarDados() { // Acción del botón
    // 1. Generar números del 1 al 6
    int nuevoDado1 = _random.nextInt(6) + 1; // Nuevo valor primer dado
    int nuevoDado2 = _random.nextInt(6) + 1; // Nuevo valor segundo dado

    // 2. Actualizar el estado para cambiar las imágenes
    setState(() { // Notifica a Flutter para redibujar
      _dado1 = nuevoDado1; // Actualiza dado 1
      _dado2 = nuevoDado2; // Actualiza dado 2
    });

    // 3. Comprobar si hay JACKPOT (Doble 6)
    if (nuevoDado1 == 6 && nuevoDado2 == 6) { // Comprueba doble seis
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡JACKPOT! Doble seis', textAlign: TextAlign.center), // Mensaje premiado
          backgroundColor: Colors.amber, // Fondo amarillo
          duration: Duration(seconds: 2), // Duración breve
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // Construye la UI cada frame
    return Scaffold( // Layout base con app bar opcional
      body: Container(
        // Fondo de pantalla (Tapestry)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tapestry.png'), // Imagen de tapete
            fit: BoxFit.cover, // Cubre todo el espacio
          ),
        ),
        child: Center( // Centra el contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinea verticalmente al centro
            children: [
              // Título
              const Text(
                'Gambling', // Texto principal
                style: TextStyle(
                  fontSize: 50, // Tamaño grande
                  fontWeight: FontWeight.bold, // Negrita
                  color: Colors.redAccent, // Color similar a la imagen
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0), // Sombra desplazada
                      blurRadius: 3.0, // Difuminado ligero
                      color: Colors.black, // Color de sombra
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40), // Separación con los dados

              // Fila con los dos dados
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente
                children: [
                  // Usamos un contenedor con sombra para que los dados resalten sobre el tapete
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(5, 5))] // Sombra marcada
                    ),
                    child: Image.asset(_imagenesDados[_dado1]!, width: 120, height: 120), // Dado izquierdo
                  ),
                  const SizedBox(width: 30), // Espacio entre dados
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(5, 5))]
                    ),
                    child: Image.asset(_imagenesDados[_dado2]!, width: 120, height: 120), // Dado derecho
                  ),
                ],
              ),
              const SizedBox(height: 60), // Espacio antes del botón

              // Botón "ROLL THE DICE"
              ElevatedButton(
                onPressed: _lanzarDados, // Acción al pulsar
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5), // Azul oscuro
                  foregroundColor: Colors.white, // Texto blanco
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Tamaño del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bordes suavizados
                  ),
                ),
                child: const Text(
                  'ROLL THE DICE', // Etiqueta del botón
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Fuente grande y fuerte
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
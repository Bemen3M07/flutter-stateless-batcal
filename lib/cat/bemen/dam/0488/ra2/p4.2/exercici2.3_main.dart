import 'dart:math'; // Biblioteca para números aleatorios
import 'package:flutter/material.dart'; // Widgets básicos de Flutter

// Exercici 2.3: Aplicació per endevinar un número PRIMERA VERSIÓ

void main() { // Punto de entrada
  runApp(MyApp()); // Lanza la app principal
}

class MyApp extends StatelessWidget { // Widget raíz sin estado
  @override
  Widget build(BuildContext context) { // Configura MaterialApp
    return MaterialApp(
      home: GuessNumberPage(), // Pantalla inicial
    );
  }
}

class GuessNumberPage extends StatefulWidget { // Pantalla con estado
  @override
  _GuessNumberPageState createState() => _GuessNumberPageState(); // Crea estado
}

class _GuessNumberPageState extends State<GuessNumberPage> { // Lógica interactiva
  final TextEditingController _controller = TextEditingController(); // Lee el input
  int randomNumber = Random().nextInt(101); // Número entre 0 y 100
  String message = ""; // Texto de feedback

  void checkNumber() { // Valida el número del usuario
    int? userNumber = int.tryParse(_controller.text); // Convierte texto a int

    if (userNumber == null) { // Caso de entrada inválida
      setState(() {
        message = "Introdueix un número vàlid."; // Mensaje de error
      });
      return; // Sale sin comparar
    }

    if (userNumber < randomNumber) { // Usuario menor que objetivo
      setState(() {
        message = "El número que busques és més gran"; // Indica subir
      });
    } else if (userNumber > randomNumber) { // Usuario mayor
      setState(() {
        message = "El número que busques és més petit"; // Indica bajar
      });
    } else {
      setState(() {
        message = "Has encertat!"; // Acierto
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Dibuja la interfaz
    return Scaffold(
      appBar: AppBar(title: Text("Endevina el número")), // Barra superior
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Margen uniforme
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            TextField(
              controller: _controller, // Enlaza con input
              keyboardType: TextInputType.number, // Abre teclado numérico
              decoration: InputDecoration(labelText: "Introdueix el número"), // Etiqueta
            ),
            SizedBox(height: 20), // Espacio antes del botón
            ElevatedButton(
              onPressed: checkNumber, // Ejecuta validación
              child: Text("Comprovar"),
            ),
            SizedBox(height: 20), // Espacio antes del mensaje
            Text(
              message, // Muestra resultado
              style: TextStyle(fontSize: 22), // Fuente grande
            ),
          ],
        ),
      ),
    );
  }
}

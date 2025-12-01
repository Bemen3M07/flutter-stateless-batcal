import 'dart:math'; // Para generar el número aleatorio
import 'package:flutter/material.dart'; // Widgets de Flutter

// Exercici 2.3: Aplicació per endevinar un número SEGONA VERSIÓ  

void main() { // Punto de inicio
  runApp(MyApp()); // Ejecuta la app
}

class MyApp extends StatelessWidget { // Widget raíz sin estado
  @override
  Widget build(BuildContext context) { // Devuelve MaterialApp
    return MaterialApp(
      home: GuessNumberPage(), // Pantalla principal
    );
  }
}

class GuessNumberPage extends StatefulWidget { // Pantalla que mantiene estado
  @override
  _GuessNumberPageState createState() => _GuessNumberPageState(); // Vincula estado
}

class _GuessNumberPageState extends State<GuessNumberPage> { // Lógica interactiva
  final TextEditingController _controller = TextEditingController(); // Lee el input
  int randomNumber = Random().nextInt(101); // Número objetivo 0-100
  String message = ""; // Mensaje al usuario
  int attempts = 0; // Contador de intentos

  void checkNumber() { // Comprueba el número del usuario
    int? userNumber = int.tryParse(_controller.text); // Convierte texto a int

    if (userNumber == null) { // Entrada no válida
      setState(() {
        message = "Introdueix un número vàlid."; // Mensaje de error
      });
      return; // Detiene el flujo
    }

    setState(() {
      attempts++; // Incrementa intento
    });

    if (userNumber < randomNumber) { // Falta subir
      setState(() {
        message = "El número que busques és més gran\nIntents: $attempts"; // Sugiere mayor
      });
    } else if (userNumber > randomNumber) { // Falta bajar
      setState(() {
        message = "El número que busques és més petit\nIntents: $attempts"; // Sugiere menor
      });
    } else {
      setState(() {
        message = "Has encertat!\nTotal intents: $attempts"; // Mensaje ganador
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Dibuja la interfaz
    return Scaffold(
      appBar: AppBar(title: Text("Endevina el número (amb intents)")), // Barra superior
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Margen uniforme
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra contenido
          children: [
            TextField(
              controller: _controller, // Conecta input
              keyboardType: TextInputType.number, // Teclado numérico
              decoration: InputDecoration(labelText: "Introdueix el número"), // Etiqueta
            ),
            SizedBox(height: 20), // Espacio vertical
            ElevatedButton(
              onPressed: checkNumber, // Ejecuta lógica
              child: Text("Comprovar"),
            ),
            SizedBox(height: 20),
            Text(
              message, // Muestra estado actual
              style: TextStyle(fontSize: 22), // Fuente grande
              textAlign: TextAlign.center, // Centra texto
            ),
          ],
        ),
      ),
    );
  }
}

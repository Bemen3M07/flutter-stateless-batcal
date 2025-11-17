import 'dart:math';
import 'package:flutter/material.dart';

// Exercici 2.3: Aplicació per endevinar un número PRIMERA VERSIÓ

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessNumberPage(),
    );
  }
}

class GuessNumberPage extends StatefulWidget {
  @override
  _GuessNumberPageState createState() => _GuessNumberPageState();
}

class _GuessNumberPageState extends State<GuessNumberPage> {
  final TextEditingController _controller = TextEditingController();
  int randomNumber = Random().nextInt(101); // Número entre 0 i 100
  String message = "";

  void checkNumber() {
    int? userNumber = int.tryParse(_controller.text);

    if (userNumber == null) {
      setState(() {
        message = "Introdueix un número vàlid.";
      });
      return;
    }

    if (userNumber < randomNumber) {
      setState(() {
        message = "El número que busques és més gran";
      });
    } else if (userNumber > randomNumber) {
      setState(() {
        message = "El número que busques és més petit";
      });
    } else {
      setState(() {
        message = "Has encertat!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Endevina el número")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Introdueix el número"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkNumber,
              child: Text("Comprovar"),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

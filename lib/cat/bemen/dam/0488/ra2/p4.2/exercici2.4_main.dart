import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(home: DiceRollerApp()));
}

class DiceRollerApp extends StatefulWidget {
  const DiceRollerApp({super.key});

  @override
  State<DiceRollerApp> createState() => _DiceRollerAppState();
}

class _DiceRollerAppState extends State<DiceRollerApp> {
  // Estado inicial de los dados (mostrando 1)
  int _dice1Number = 1;
  int _dice2Number = 1;
  final Random _random = Random();

  void _rollDice() {
    // Generar números aleatorios entre 1 y 6
    int newDice1 = _random.nextInt(6) + 1;
    int newDice2 = _random.nextInt(6) + 1;

    // Actualizar el estado para redibujar los daus
    setState(() {
      _dice1Number = newDice1;
      _dice2Number = newDice2;
    });

    // Comprobar el JACKPOT
    if (newDice1 == 6 && newDice2 == 6) {
      _showJackpotMessage();
    }
  }

  // Muestra un SnackBar (Toast) para el JACKPOT
  void _showJackpotMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          '¡JACKPOT! Has tret dos 6!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red.shade700,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Genera la ruta al archivo SVG basado en el número
  String _getDiceImagePath(int number) {
    // RUTA AJUSTADA a tu estructura: assets/images/diceroller/
    return 'assets/images/diceroller/dice_$number.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fons de pantalla (tapestry.png)
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/diceroller/tapestry.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // TÍTULO: "Gambling" y Icona
            Column(
              children: [
                Image.asset(
                  'assets/images/diceroller/dicerollericon.jpg',
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Gambling',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            // Daus (Die 1 i Die 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Dau 1 (SVG)
                SvgPicture.asset(
                  _getDiceImagePath(_dice1Number),
                  height: 150,
                  width: 150,
                ),
                const SizedBox(width: 20),
                // Dau 2 (SVG)
                SvgPicture.asset(
                  _getDiceImagePath(_dice2Number),
                  height: 150,
                  width: 150,
                ),
              ],
            ),

            // BOTÓ "ROLL THE DICE"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: ElevatedButton(
                onPressed: _rollDice,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text(
                  'ROLL THE DICE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
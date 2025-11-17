import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScoreBoard(),
    );
  }
}

class ScoreBoard extends StatefulWidget {
  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int scoreLeft = 0;
  int scoreRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // --- PART SUPERIOR: MARCADOR ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$scoreLeft",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$scoreRight",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // --- BOTONS SCORE ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() => scoreLeft++);
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
                ElevatedButton(
                  onPressed: () {
                    setState(() => scoreRight++);
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

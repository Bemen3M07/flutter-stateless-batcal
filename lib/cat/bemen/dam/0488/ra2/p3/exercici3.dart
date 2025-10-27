import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is a resorce string'),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/images/foto.png'),
              ),
            ]
        ),
        ),
      ),
    );
  }
}

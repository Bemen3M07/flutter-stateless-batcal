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
              const Text('Welcome!'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Button Login Pressed');
                },
                child: const Text('Login'),
              )
              ElevatedButton(
                onPressed: () {
                  print('Button Register Pressed');
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
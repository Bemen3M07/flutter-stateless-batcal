import 'package:flutter/material.dart';

void main() {
  // Simplificamos la inicialización
  runApp(const MaterialApp(home: SayHelloApp()));
}

// 1. StatefulWidget para la gestión de estado
class SayHelloApp extends StatefulWidget {
  const SayHelloApp({super.key});
  @override
  State<SayHelloApp> createState() => _SayHelloAppState();
}

class _SayHelloAppState extends State<SayHelloApp> {
  // 2. Controlador para leer la entrada de texto
  final TextEditingController _controller = TextEditingController();

  // Lógica para mostrar el diálogo al presionar el botón
  void _showDialog(BuildContext context) {
    String name = _controller.text.trim();
    String greeting = name.isEmpty ? "HELLO !" : "HELLO $name"; // Saludo si está vacío

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          greeting,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Centramos los widgets horizontalmente
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: <Widget>[
              // Campo de texto
              SizedBox( // Usamos SizedBox para limitar el ancho del TextField
                width: 300, 
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Botón "SayHello"
              ElevatedButton(
                // A J U S T E 2: Estilo para color y forma del botón pequeño
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800, // Color azul oscuro
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajuste de tamaño
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Borde redondeado
                  ),
                ),
                onPressed: () => _showDialog(context),
                child: const Text('SayHello', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
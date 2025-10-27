import 'package:flutter/material.dart'; // Importa widgets de Flutter

void main() { // Función principal de la app
  runApp(const MainApp()); // Inicia la aplicación Flutter
}

class MainApp extends StatelessWidget { // Widget principal sin estado
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) { // Construye la interfaz
    return  MaterialApp( // Configuración de la aplicación
      home: Scaffold( // Estructura básica de pantalla
        body: Center( // Centra el contenido
          child: Column( // Columna vertical para organizar elementos
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              const Text('Welcome!'), // Texto de bienvenida
              const Text ('Start Learning Now'), // Texto motivacional
              const SizedBox(height: 20), // Espaciado vertical
              ElevatedButton( // Botón elevado de login
                onPressed: () { // Función al presionar
                  print('Button Login Pressed'); // Imprime mensaje en consola
                },
                style: ElevatedButton.styleFrom( // Estilo del botón
                  backgroundColor: Colors.blue, // Color de fondo azul
                  foregroundColor: Colors.white, // Color del texto blanco
                ),
                child: const Text('Login'), // Texto del botón
              ),
              const SizedBox(height: 10), // Espaciado vertical menor
              ElevatedButton( // Botón elevado de registro
                onPressed: () { // Función al presionar
                  print('Button Register Pressed'); // Imprime mensaje en consola
                },
                style: ElevatedButton.styleFrom( // Estilo del botón
                  backgroundColor: Colors.blue, // Color de fondo azul
                  foregroundColor: Colors.white, // Color del texto blanco
                ),
                child: const Text('Register'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
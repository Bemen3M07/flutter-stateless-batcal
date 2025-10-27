import 'package:flutter/material.dart'; // Importa widgets de Flutter

void main() { // Función principal de la app
  runApp(const MainApp()); // Inicia la aplicación Flutter
}

class MainApp extends StatelessWidget { // Widget principal sin estado
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) { // Construye la interfaz
    return const MaterialApp( // Configuración de la aplicación
      home: Scaffold( // Estructura básica de pantalla
        body: Center( // Centra el contenido
          child: Column( // Columna vertical para organizar elementos
             mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            children: [
              Text('This is a resorce string'), // Texto de recurso
              SizedBox(height: 20), // Espaciado vertical
              Image( // Widget de imagen
                image: AssetImage('assets/images/foto.png'), // Ruta de la imagen
              ),
            ]
        ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart'; // Importa librerías de Flutter

void main() { // Función principal de la app
  // Simplificamos la inicialización
  runApp(const MaterialApp(home: SayHelloApp())); // Ejecuta la app con MaterialApp
}

// 1. StatefulWidget para la gestión de estado
class SayHelloApp extends StatefulWidget { // Widget con estado (puede cambiar)
  const SayHelloApp({super.key}); // Constructor con key opcional
  @override
  State<SayHelloApp> createState() => _SayHelloAppState(); // Crea el estado del widget
}

class _SayHelloAppState extends State<SayHelloApp> { // Clase que maneja el estado
  // 2. Controlador para leer la entrada de texto
  final TextEditingController _controller = TextEditingController(); // Controla el input de texto

  // Lógica para mostrar el diálogo al presionar el botón
  void _showDialog(BuildContext context) { // Función que muestra el diálogo
    String name = _controller.text.trim(); // Obtiene texto sin espacios
    String greeting = name.isEmpty ? "HELLO !" : "HELLO $name"; // Saludo si está vacío

    showDialog( // Muestra ventana emergente
      context: context, // Contexto actual de la app
      builder: (_) => AlertDialog( // Construye diálogo de alerta
        content: Text( // Contenido del diálogo
          greeting, // Texto del saludo
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Estilo: tamaño 24, negrita
        ),
      ),
    );
  }

  @override
  void dispose() { // Método que se ejecuta al destruir el widget
    _controller.dispose(); // Libera memoria del controlador
    super.dispose(); // Llama al dispose del widget padre
  }

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return Scaffold( // Estructura básica de una pantalla
      body: Center( // Centra todo el contenido
        child: Padding( // Añade espaciado interno
          padding: const EdgeInsets.all(40.0), // 40 píxeles de margen en todos los lados
          child: Column( // Organiza widgets en columna vertical
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            // Centramos los widgets horizontalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente
            children: <Widget>[ // Lista de widgets hijos
              // Campo de texto
              SizedBox( // Usamos SizedBox para limitar el ancho del TextField
                width: 300, // Ancho fijo de 300 píxeles
                child: TextField( // Campo de entrada de texto
                  controller: _controller, // Conecta con el controlador
                  decoration: const InputDecoration( // Decoración del campo
                    labelText: 'Name', // Etiqueta que dice "Name"
                    border: OutlineInputBorder(), // Borde rectangular
                  ),
                ),
              ),
              const SizedBox(height: 30), // Espacio vertical de 30 píxeles
              // Botón "SayHello"
              ElevatedButton( // Botón con elevación (sombra)
                // Estilo para color y forma del botón pequeño
                style: ElevatedButton.styleFrom( // Personalización del estilo
                  backgroundColor: Colors.blue.shade800, // Color azul oscuro de fondo
                  foregroundColor: Colors.white, // Color blanco del texto
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajuste de tamaño: 20px horizontal, 15px vertical
                  shape: RoundedRectangleBorder( // Forma del botón
                    borderRadius: BorderRadius.circular(20), // Borde redondeado de 20px
                  ),
                ),
                onPressed: () => _showDialog(context), // Acción: ejecuta _showDialog al presionar
                child: const Text('SayHello', style: TextStyle(fontSize: 18)), // Texto del botón con tamaño 18
              ),
            ], // Fin de la lista de widgets
          ),
        ),
      ),
    );
  }
} // Fin de la clase
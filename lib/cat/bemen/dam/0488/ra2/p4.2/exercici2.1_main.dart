import 'package:flutter/material.dart'; // Widgets y estilos básicos

void main() => runApp(const MyApp()); // Punto de entrada que lanza la app

class MyApp extends StatelessWidget { // Raíz sin estado
	const MyApp({super.key}); // Constructor constante

	@override
	Widget build(BuildContext context) { // Configura MaterialApp
		return const MaterialApp(
			debugShowCheckedModeBanner: false, // Oculta etiqueta Debug
			home: Exercici21Main(), // Pantalla inicial
		);
	}
}

class Exercici21Main extends StatefulWidget { // Widget con estado
	const Exercici21Main({super.key}); // Constructor

	@override
	State<Exercici21Main> createState() => _Exercici21MainState(); // Vincula estado
}

class _Exercici21MainState extends State<Exercici21Main> { // Lógica mutable
	String _message = 'Good ?!'; // Texto mostrado inicialmente

	void _setMorning() { // Cambia mensaje a mañanas
		setState(() {
			_message = 'good morning'; // Actualiza estado
		});
	}

	void _setNight() { // Cambia mensaje a noches
		setState(() {
			_message = 'good night'; // Actualiza estado
		});
	}

	@override
	Widget build(BuildContext context) { // Dibuja la interfaz
		return Scaffold(
			
			body: Center( // Centra el contenido
				child: Column(
					mainAxisSize: MainAxisSize.min, // Solo ocupa lo necesario
					children: [
						Text(
							_message, // Muestra el saludo
							style: const TextStyle(fontSize: 28), // Tamaño grande
							textAlign: TextAlign.center, // Centra texto
						),
						const SizedBox(height: 24), // Espacio vertical
						Row(
							mainAxisSize: MainAxisSize.min, // Anchura ajustada
							children: [
								ElevatedButton(
									onPressed: _setMorning, // Mensaje de mañana
									child: const Text('Morning'),
								),
								const SizedBox(width: 12), // Separador horizontal
								ElevatedButton(
									onPressed: _setNight, // Mensaje de noche
									child: const Text('Night'),
								),
							]
						)
					],
				),
			),
		);
	}
}


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			debugShowCheckedModeBanner: false,
			home: Exercici21Main(),
		);
	}
}

class Exercici21Main extends StatefulWidget {
	const Exercici21Main({super.key});

	@override
	State<Exercici21Main> createState() => _Exercici21MainState();
}

class _Exercici21MainState extends State<Exercici21Main> {
	String _message = 'Good ?!';

	void _setMorning() {
		setState(() {
			_message = 'good morning';
		});
	}

	void _setNight() {
		setState(() {
			_message = 'good night';
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			
			body: Center(
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Text(
							_message,
							style: const TextStyle(fontSize: 28),
							textAlign: TextAlign.center,
						),
						const SizedBox(height: 24),
						Row(
							mainAxisSize: MainAxisSize.min,
							children: [
								ElevatedButton(
									onPressed: _setMorning,
									child: const Text('Morning'),
								),
								const SizedBox(width: 12),
								ElevatedButton(
									onPressed: _setNight,
									child: const Text('Night'),
								),
							],
						)
					],
				),
			),
		);
	}
}


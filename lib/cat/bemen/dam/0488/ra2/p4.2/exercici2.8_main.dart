import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider para la navegación
class NavigationProvider extends ChangeNotifier {
  int _selectedPage = 0;
  int _selectedExercise = 0;

  int get selectedPage => _selectedPage;
  int get selectedExercise => _selectedExercise;

  void changePage(int index) {
    _selectedPage = index;
    _selectedExercise = 0; // Reinicia el ejercicio al cambiar de página
    notifyListeners();
  }

  void changeExercise(int index) {
    _selectedExercise = index;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercici 2.8 - Navegació',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Lista de ejercicios Stateless (puedes añadir los tuyos aquí)
  static const List<String> statelessExercises = [
    'Exercici 1.1',
    'Exercici 1.2',
    'Exercici 1.3',
    'Exercici 1.4',
    'Exercici 1.5',
    'Exercici 1.6',
  ];

  // Lista de ejercicios Stateful
  static const List<String> statefulExercises = [
    'Exercici 2.1',
    'Exercici 2.2',
    'Exercici 2.3',
    'Exercici 2.4',
    'Exercici 2.5',
    'Exercici 2.6',
    'Exercici 2.7',
  ];

  Widget _buildStatelessContent(int exerciseIndex) {
    // Aquí puedes retornar los widgets de cada ejercicio stateless
    return Center(
      child: Text(
        'Contingut de ${statelessExercises[exerciseIndex]}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildStatefulContent(int exerciseIndex) {
    // Aquí puedes retornar los widgets de cada ejercicio stateful
    return Center(
      child: Text(
        'Contingut de ${statefulExercises[exerciseIndex]}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();
    final selectedPage = navigationProvider.selectedPage;
    final selectedExercise = navigationProvider.selectedExercise;

    // Determina qué lista de ejercicios mostrar
    final exerciseList = selectedPage == 0 ? statelessExercises : statefulExercises;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercici 2.8 - Navegació'),
        actions: [
          // Menú superior para seleccionar ejercicios
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<int>(
              value: selectedExercise,
              dropdownColor: Colors.purple,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  context.read<NavigationProvider>().changeExercise(newValue);
                }
              },
              items: List.generate(
                exerciseList.length,
                (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text(exerciseList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
      body: selectedPage == 0
          ? _buildStatelessContent(selectedExercise)
          : _buildStatefulContent(selectedExercise),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (int index) {
          context.read<NavigationProvider>().changePage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Stateless',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Stateful',
          ),
        ],
      ),
    );
  }
}
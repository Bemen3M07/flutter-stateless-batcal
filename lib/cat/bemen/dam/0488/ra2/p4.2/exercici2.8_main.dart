// Archivo: lib/cat/bemen/dam/0488/ra2/p4.2/exercici2.8_main1.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. IMPORTACIONES DE LOS EJERCICIOS
import 'exercici2.2_main.dart'; 
import 'exercici2.4_main.dart'; 
import 'exercici2.6_main.dart'; 
// import '../p3/exercici1.main_1.dart'; 

// 2. LÓGICA DE ESTADO (Provider Integrado)
enum TipoPagina { stateless, stateful }

class NavegacionProvider with ChangeNotifier {
  TipoPagina _paginaActual = TipoPagina.stateful;
  TipoPagina get paginaActual => _paginaActual;
  
  int _ejercicioStatefulSeleccionado = 6; 

  final _ejerciciosStatefulMap = const {
    2: 'Ejercicio 2.2: Say Hello',
    4: 'Ejercicio 2.4: Dice Roller',
    6: 'Ejercicio 2.6: Shopping List',
    8: 'Ejercicio 2.8: Navegación',
  };
  
  void setPaginaActual(TipoPagina pagina) {
    if (_paginaActual != pagina) {_paginaActual = pagina; notifyListeners();}
  }

  void setEjercicioStateful(int id) {
    if (_ejercicioStatefulSeleccionado != id) {_ejercicioStatefulSeleccionado = id; notifyListeners();}
  }

  Widget getCurrentStatefulWidget() {
    switch (_ejercicioStatefulSeleccionado) {
      case 2: return const SayHelloApp();
      case 4: return const DiceRollerApp();
      case 6: return const ListaCompraApp();
      case 8: return const Center(child: Text("Selecciona un ejercicio StateFul del menú superior.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.blueGrey)));
      default: return const Center(child: Text("Error de selección."));
    }
  }
  
  Widget getCurrentStatelessWidget() {
    // return const Exercici1Main1Widget(); 
    return const Center(child: Text("Página 1: Contenido de Ejercicios Stateless"));
  }
}

// 3. APLICACIÓN PRINCIPAL (Widgets de la Interfaz)

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => NavegacionProvider(),
    child: const MaterialApp(
      title: 'Exercici 2.8 Navegación',
      home: NavegacionScreen(),
    ),
  ),
);

class NavegacionScreen extends StatelessWidget {
  const NavegacionScreen({super.key});

  Widget _buildStatefulMenu(BuildContext context, NavegacionProvider provider) {
    return DropdownButton<int>(
      value: provider._ejercicioStatefulSeleccionado,
      icon: const Icon(Icons.arrow_downward, color: Colors.white),
      dropdownColor: Colors.blueGrey.shade700,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      underline: Container(height: 2, color: Colors.white),
      onChanged: (int? nuevoId) {
        if (nuevoId != null) { provider.setEjercicioStateful(nuevoId); }
      },
      items: provider._ejerciciosStatefulMap.entries.map<DropdownMenuItem<int>>((entry) => 
        DropdownMenuItem<int>(
          value: entry.key,
          child: Text(entry.value),
        )
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavegacionProvider>();
    final isStateful = provider.paginaActual == TipoPagina.stateful;

    Widget bodyContent = isStateful 
        ? provider.getCurrentStatefulWidget()
        : provider.getCurrentStatelessWidget();
        
    Widget titleWidget = isStateful 
        ? _buildStatefulMenu(context, provider) 
        : const Text("Página 1: Exercicis Stateless");

    return Scaffold(
      appBar: AppBar(title: titleWidget, backgroundColor: Colors.blueGrey),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: isStateful ? 1 : 0,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          final nuevaPagina = index == 0 ? TipoPagina.stateless : TipoPagina.stateful;
          context.read<NavegacionProvider>().setPaginaActual(nuevaPagina);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Página 1 (Stateless)'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: 'Página 2 (Stateful)'),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart'; // Importa librerías de Flutter

void main() => runApp(const MaterialApp(home: ListaCompraApp())); // Función principal que ejecuta la app

class ArticuloCompra { // Clase modelo para un artículo de compra
  final String nombre; // Nombre del artículo
  final int cantidad; // Cantidad del artículo
  ArticuloCompra(this.nombre, this.cantidad); // Constructor que recibe nombre y cantidad
} // Fin de la clase ArticuloCompra

class ListaCompraApp extends StatefulWidget { // Widget principal con estado
  const ListaCompraApp({super.key}); // Constructor con key opcional
  @override
  State<ListaCompraApp> createState() => _ListaCompraAppState(); // Crea el estado del widget
} // Fin de ListaCompraApp

class _ListaCompraAppState extends State<ListaCompraApp> { // Clase que maneja el estado
  final _controladorNombre = TextEditingController(); // Controlador para el campo nombre
  final _controladorCantidad = TextEditingController(); // Controlador para el campo cantidad
  final List<ArticuloCompra> _listaArticulos = []; // Lista que almacena los artículos

  void _agregarArticulo() { // Función para añadir un artículo
    final nombreArticulo = _controladorNombre.text.trim(); // Obtiene el texto del nombre sin espacios
    final cantidadArticulo = int.tryParse(_controladorCantidad.text) ?? 1; // Convierte cantidad a número, por defecto 1

    if (nombreArticulo.isNotEmpty) { // Verifica que el nombre no esté vacío
      setState(() { // Actualiza el estado del widget
        _listaArticulos.add(ArticuloCompra(nombreArticulo, cantidadArticulo)); // Añade artículo a la lista
      });
      _controladorNombre.clear(); // Limpia el campo nombre
      _controladorCantidad.clear(); // Limpia el campo cantidad
    }
  }

  @override
  void dispose() { // Método que se ejecuta al destruir el widget
    _controladorNombre.dispose(); // Libera memoria del controlador nombre
    _controladorCantidad.dispose(); // Libera memoria del controlador cantidad
    super.dispose(); // Llama al dispose del widget padre
  }

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz
    return Scaffold( // Estructura básica de una pantalla
      body: Center( // Centra el contenido
        child: SizedBox( // Caja con tamaño específico
          width: 350, // Ancho de 350 píxeles
          child: Padding( // Añade espaciado interno
            padding: const EdgeInsets.all(20.0), // 20 píxeles de margen en todos los lados
            child: Column( // Organiza widgets en columna vertical
              children: <Widget>[ // Lista de widgets hijos
                Card( // Tarjeta con sombra para el formulario
                  elevation: 4, // Elevación de 4 para crear sombra
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Bordes redondeados de 15px
                  child: Padding( // Espaciado interno de la tarjeta
                    padding: const EdgeInsets.all(15.0), // 15 píxeles de margen interno
                    child: Column( // Columna dentro de la tarjeta
                      children: [ // Lista de widgets del formulario
                        TextField( // Campo de texto para el nombre
                          controller: _controladorNombre, // Conecta con el controlador de nombre
                          decoration: const InputDecoration(labelText: 'Nombre', border: OutlineInputBorder()), // Decoración con etiqueta y borde
                        ),
                        const SizedBox(height: 10), // Espacio vertical de 10 píxeles
                        TextField( // Campo de texto para la cantidad
                          controller: _controladorCantidad, // Conecta con el controlador de cantidad
                          keyboardType: TextInputType.number, // Teclado numérico
                          decoration: const InputDecoration(labelText: 'Cantidad', border: OutlineInputBorder()), // Decoración con etiqueta y borde
                        ),
                        const SizedBox(height: 20), // Espacio vertical de 20 píxeles
                        ElevatedButton( // Botón elevado para añadir
                          onPressed: _agregarArticulo, // Acción: ejecuta _agregarArticulo al presionar
                          style: ElevatedButton.styleFrom( // Estilo personalizado del botón
                            backgroundColor: Colors.blueGrey, // Color de fondo gris azulado
                            foregroundColor: Colors.white, // Color del texto blanco
                          ),
                          child: const Text('Añadir'), // Texto del botón
                        ),
                      ], // Fin de widgets del formulario
                    ),
                  ),
                ), // Fin de la Card del formulario
                const SizedBox(height: 20), // Espacio vertical de 20 píxeles
                
                Expanded( // Ocupa todo el espacio disponible restante
                  child: ListView.builder( // Lista deslizable que construye elementos dinámicamente
                    itemCount: _listaArticulos.length, // Número de elementos en la lista
                    itemBuilder: (context, indice) { // Función que construye cada elemento
                      final articulo = _listaArticulos[indice]; // Obtiene el artículo en la posición actual
                      return Card( // Tarjeta para cada artículo
                        margin: const EdgeInsets.symmetric(vertical: 8.0), // Margen vertical de 8 píxeles
                        child: ListTile( // Widget especializado para elementos de lista
                          title: Text(articulo.nombre), // Texto principal: nombre del artículo
                          trailing: Text('${articulo.cantidad}', style: const TextStyle(fontSize: 18, color: Colors.indigo)), // Texto al final: cantidad con estilo
                        ),
                      );
                    },
                  ),
                ),
              ], // Fin de la lista de widgets de la columna
            ),
          ),
        ),
      ),
    );
  }
} // Fin de la clase _ListaCompraAppState
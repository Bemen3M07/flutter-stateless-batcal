import 'package:flutter/material.dart'; // Importa widgets de Flutter
import 'dart:math'; // Para generar números aleatorios

class Message { // Clase para representar un mensaje
  final String author; // Nombre del autor del mensaje
  final String body; // Contenido del mensaje

  Message(this.author, this.body); // Constructor de la clase
}

void main() { // Función principal de la app
  runApp(const MyApp()); // Inicia la aplicación Flutter
}

class MyApp extends StatelessWidget { // Widget principal sin estado
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // Construye la interfaz
    return MaterialApp( // Configuración de la aplicación
      title: 'Messages App', // Título de la aplicación
      theme: ThemeData( // Tema visual de la app
        primarySwatch: Colors.blue, // Color principal azul
      ),
      home: const MessageListScreen(), // Pantalla inicial
    );
  }
}

class MessageListScreen extends StatefulWidget { // Pantalla con estado mutable
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState(); // Crea el estado
}

class _MessageListScreenState extends State<MessageListScreen> {
  final ScrollController _scrollController = ScrollController(); // Controla el scroll de la lista
  final List<Message> _displayedMessages = []; // Mensajes mostrados en pantalla
  int _selectedIndex = 0; // Índice seleccionado en barra inferior
  
  // Lista de nombres predefinidos para los autores
  final names = [
    "Ellison Curry",
    "Briggs Willis",
    "Alexa Murphy",
    "Cameron Berry",
    "Annabelle Villarreal",
    "Nikolai Wiley",
    "Lauryn Morrow",
    "Kyree Hardy",
    "Wells Wilson",
    "Luna Foster",
    "Kayden Taylor",
    "Sofia Mann",
    "Nehemiah Randall",
    "Christina Gordon",
    "Karter Kramer",
    "Hanna Morales",
    "Megan Delarosa",
    "Osiris Johnson",
    "Emma Atkins",
    "Cason McKee",
    "Kori Walls",
    "Larry Shepherd",
  ];

  // Texto del mensaje (igual para todos)
  static const body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";
  
  late List<Message> allMessages; // Lista completa de todos los mensajes
  final random = Random(); // Generador de números aleatorios
  
  int _currentIndex = 0; // Índice actual de carga
  final int _itemsPerLoad = 10; // Cuántos mensajes cargar cada vez

  @override
  void initState() { // Se ejecuta cuando se crea el widget
    super.initState();
    
    // Genera 100 mensajes con autores aleatorios
    allMessages = List.generate(100, (index) {
      return Message(
        names[random.nextInt(names.length)], // Selecciona autor aleatorio
        body, // Usa el mismo texto para todos
      );
    });
    
    // Carga los primeros mensajes
    _loadMoreMessages();
    
    // Escucha cuando el usuario hace scroll
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() { // Detecta cuando llegar cerca del final
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreMessages(); // Carga más mensajes
    }
  }

  void _loadMoreMessages() { // Carga más mensajes en la lista
    if (_currentIndex < allMessages.length) { // Si quedan mensajes por cargar
      setState(() { // Actualiza la interfaz
        final endIndex = (_currentIndex + _itemsPerLoad < allMessages.length) 
            ? _currentIndex + _itemsPerLoad 
            : allMessages.length; // Calcula hasta dónde cargar
        
        _displayedMessages.addAll( // Añade mensajes a la lista mostrada
          allMessages.sublist(_currentIndex, endIndex)
        );
        _currentIndex = endIndex; // Actualiza el índice actual
      });
      
      print('Cargados ${_displayedMessages.length} de ${allMessages.length} mensajes'); // Debug
    }
  }

  @override
  void dispose() { // Limpia recursos al destruir el widget
    _scrollController.dispose(); // Libera el controlador de scroll
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { // Construye la interfaz de usuario
    return Scaffold( // Estructura básica de pantalla Flutter
      backgroundColor: const Color(0xFFFAFAFA), // Color de fondo gris claro
      // Barra superior con título y botones
      appBar: AppBar(
        title: const Text('Messages'), // Título "Messages"
        backgroundColor: const Color(0xFF007bff), // Color azul
        foregroundColor: Colors.white, // Texto blanco
        actions: [ // Botones en la parte derecha
          IconButton( // Botón de búsqueda
            icon: const Icon(Icons.search),
            onPressed: () {
              // Sin funcionalidad (vacío)
            },
          ),
          IconButton( // Botón de menú (3 puntos)
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Sin funcionalidad (vacío)
            },
          ),
        ],
      ),
      body: ListView.builder( // Lista scrolleable que construye elementos dinámicamente
        controller: _scrollController, // Controlador para detectar scroll
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor de la lista
        itemCount: _displayedMessages.length + 1, // +1 para el indicador de carga
        itemBuilder: (context, index) { // Función que construye cada elemento
          if (index < _displayedMessages.length) { // Si es un mensaje normal
            return _buildMessageCard(_displayedMessages[index]); // Construye tarjeta de mensaje
          } else { // Si es el último elemento (indicador de carga)
            return _currentIndex < allMessages.length // Si quedan mensajes por cargar
                ? const Padding( // Muestra indicador de carga giratorio
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink(); // No muestra nada si ya cargó todo
          }
        },
      ),
      floatingActionButton: FloatingActionButton( // Botón circular flotante
        onPressed: () {
          // Sin funcionalidad (vacío)
        },
        backgroundColor: const Color(0xFF007bff), // Color azul
        child: const Icon(Icons.add, color: Colors.white), // Icono + blanco
      ),
      // Barra de navegación inferior con pestañas
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Tipo fijo (no se mueve)
        currentIndex: _selectedIndex, // Pestaña actualmente seleccionada
        onTap: (int index) { // Función cuando se toca una pestaña
          setState(() { // Actualiza la interfaz
            _selectedIndex = index; // Cambia la pestaña seleccionada
          });
        },
        selectedItemColor: const Color(0xFF007bff), // Color azul para seleccionado
        unselectedItemColor: Colors.grey, // Color gris para no seleccionado
        items: const [ // Lista de pestañas de la barra inferior
          BottomNavigationBarItem( // Pestaña de mensajes
            icon: Icon(Icons.message), // Icono de mensaje
            label: 'Messages', // Texto "Messages"
          ),
          BottomNavigationBarItem( // Pestaña de contactos
            icon: Icon(Icons.contacts), // Icono de contactos
            label: 'Contacts', // Texto "Contacts"
          ),
          BottomNavigationBarItem( // Pestaña de llamadas
            icon: Icon(Icons.call), // Icono de teléfono
            label: 'Calls', // Texto "Calls"
          ),
          BottomNavigationBarItem( // Pestaña de configuración
            icon: Icon(Icons.settings), // Icono de configuración
            label: 'Settings', // Texto "Settings"
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard(Message message) { // Función que construye una tarjeta de mensaje
    return Container( // Contenedor principal de la tarjeta
      margin: const EdgeInsets.only(bottom: 10), // Margen inferior entre tarjetas
      padding: const EdgeInsets.all(16), // Espaciado interno de la tarjeta
      decoration: BoxDecoration( // Decoración visual de la tarjeta
        color: const Color(0xFFE0E0E0), // Color de fondo gris claro
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
      ),
      child: Column( // Columna vertical para organizar contenido
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
        children: [
          Text( // Texto del nombre del autor
            message.author,
            style: const TextStyle( // Estilo del texto del autor
              fontSize: 18, // Tamaño de fuente
              fontWeight: FontWeight.bold, // Texto en negrita
            ),
          ),
          const SizedBox(height: 8), // Espaciado vertical entre autor y mensaje
          Text( // Texto del contenido del mensaje
            message.body,
            style: const TextStyle(fontSize: 14), // Tamaño de fuente normal
          ),
        ],
      ),
    );
  }
}
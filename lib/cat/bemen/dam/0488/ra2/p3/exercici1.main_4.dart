import 'package:flutter/material.dart'; // Importa widgets de Flutter

// ----------------------------------------------------------------------
// 1. Definición de la Clase Contact
// Clase inmutable que contiene los datos del contacto.
// ----------------------------------------------------------------------
class Contact { // Clase para representar un contacto
  final String fullName; // Nombre completo del contacto
  final String email; // Email del contacto
  final String phone; // Teléfono del contacto

  // Constructor requerido
  Contact({required this.fullName, required this.email, required this.phone}); // Constructor con parámetros obligatorios
}

// Función principal que inicia la aplicación
void main() { // Función principal de la app
  runApp(const ContactCardApp()); // Inicia la aplicación Flutter
}

// ----------------------------------------------------------------------
// 2. Widget Principal de la Aplicación
// ----------------------------------------------------------------------
class ContactCardApp extends StatelessWidget { // Widget principal sin estado
  const ContactCardApp({super.key});

  @override
  Widget build(BuildContext context) { // Construye la interfaz
    // Creación del objeto Contact con los datos solicitados
    final marta = Contact( // Crea una instancia de contacto
      fullName: 'Monkey D. Mono', // Nombre completo
      email: 'mono@mono.com', // Email del contacto
      phone: '+34 999 999 999', // Teléfono del contacto
    );

    return MaterialApp( // Configuración de la aplicación
      title: 'Targeta de Contacte', // Título de la aplicación
      debugShowCheckedModeBanner: false, // Oculta banner de debug
      // Configura el tema para usar una fuente por defecto sans-serif
      theme: ThemeData( // Tema visual de la app
        fontFamily: 'Roboto', // Fuente Roboto
        primarySwatch: Colors.blue, // Color principal azul
      ),
      home: Scaffold( // Estructura básica de pantalla
        backgroundColor: Colors.white, // Fondo blanco
        body: Center( // Centra el contenido
          // Pasa el objeto de contacto al widget que construye la UI
          child: ContactDetailCard(contact: marta), // Widget de tarjeta de contacto
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// 3. Widget de la Tarjeta de Detalle (UI)
// ----------------------------------------------------------------------
class ContactDetailCard extends StatelessWidget { // Widget sin estado para la tarjeta
  final Contact contact; // Contacto a mostrar
  const ContactDetailCard({required this.contact, super.key}); // Constructor

  @override
  Widget build(BuildContext context) { // Construye la interfaz de la tarjeta
    return Column( // Columna vertical para organizar elementos
      mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
      crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente
      children: <Widget>[
        // Área de la Imagen: Utiliza ClipOval para recortar la imagen local
        ClipOval( // Recorta la imagen en círculo
          child: Image( // Widget de imagen
            image: const AssetImage('assets/images/Imagen1.png'), // Ruta de la imagen
            width: 120, // Ancho de la imagen
            height: 120, // Alto de la imagen
            fit: BoxFit.cover, // Ajuste de la imagen
          ),
        ),
        
        const SizedBox(height: 24.0), // Espaciado vertical

        // Nombre del Contacto
        Text( // Texto del nombre
          contact.fullName, // Nombre del contacto
          style: const TextStyle( // Estilo del texto
            fontSize: 28.0, // Tamaño de fuente grande
            fontWeight: FontWeight.bold, // Texto en negrita
            color: Colors.black, // Color negro
          ),
        ),
        
        const SizedBox(height: 32.0), // Espaciado vertical mayor

        // Contenedor de Información de Contacto (Email y Teléfono)
        Container( // Contenedor con decoración
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Espaciado interno
          width: 300, // Ancho fijo del contenedor
          decoration: BoxDecoration( // Decoración del contenedor
            color: Colors.grey.shade200, // Fondo gris claro
            borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
            boxShadow: [ // Sombra del contenedor
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // Color de la sombra
                spreadRadius: 1, // Expansión de la sombra
                blurRadius: 7, // Difuminado de la sombra
                offset: const Offset(0, 3), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: Column( // Columna para email y teléfono
            children: <Widget>[
              // Muestra Email
              _buildInfoRow(Icons.email, contact.email), // Fila con email
              // Muestra Teléfono
              _buildInfoRow(Icons.phone, contact.phone), // Fila con teléfono
            ],
          ),
        ),
      ],
    );
  }

  // Método privado para generar las filas de información (optimización)
  Widget _buildInfoRow(IconData icon, String text) { // Función que construye una fila de información
    return ListTile( // Widget de lista para mostrar icono y texto
      leading: Icon(icon, color: Colors.black87, size: 24), // Icono a la izquierda
      title: Text( // Texto principal
        text, // Contenido del texto (email o teléfono)
        style: const TextStyle( // Estilo del texto
          fontSize: 18.0, // Tamaño de fuente mediano
          color: Colors.black87, // Color gris oscuro
        ),
      ),
      contentPadding: EdgeInsets.zero, // Sin espaciado extra
      horizontalTitleGap: 8.0, // Espacio entre icono y texto
    );
  }
}
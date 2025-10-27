import 'package:flutter/material.dart';

// ----------------------------------------------------------------------
// 1. Definición de la Clase Contact
// Clase inmutable que contiene los datos del contacto.
// ----------------------------------------------------------------------
class Contact {
  final String fullName;
  final String email;
  final String phone;

  // Constructor requerido
  Contact({required this.fullName, required this.email, required this.phone});
}

// Función principal que inicia la aplicación
void main() {
  runApp(const ContactCardApp());
}

// ----------------------------------------------------------------------
// 2. Widget Principal de la Aplicación
// ----------------------------------------------------------------------
class ContactCardApp extends StatelessWidget {
  const ContactCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Creación del objeto Contact con los datos solicitados
    final marta = Contact(
      fullName: 'Monkey D. Mono',
      email: 'mono@mono.com',
      phone: '+34 999 999 999',
    );

    return MaterialApp(
      title: 'Targeta de Contacte',
      debugShowCheckedModeBanner: false,
      // Configura el tema para usar una fuente por defecto sans-serif
      theme: ThemeData(
        fontFamily: 'Roboto', 
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // Pasa el objeto de contacto al widget que construye la UI
          child: ContactDetailCard(contact: marta),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// 3. Widget de la Tarjeta de Detalle (UI)
// ----------------------------------------------------------------------
class ContactDetailCard extends StatelessWidget {
  final Contact contact;
  const ContactDetailCard({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Área de la Imagen: Utiliza ClipOval para recortar la imagen local
        ClipOval(
          child: Image(
            image: const AssetImage('assets/images/Imagen1.png'),
            width: 120, 
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        
        const SizedBox(height: 24.0),

        // Nombre del Contacto
        Text(
          contact.fullName,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        
        const SizedBox(height: 32.0),

        // Contenedor de Información de Contacto (Email y Teléfono)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Fondo gris claro
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), 
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              // Muestra Email
              _buildInfoRow(Icons.email, contact.email),
              // Muestra Teléfono
              _buildInfoRow(Icons.phone, contact.phone),
            ],
          ),
        ),
      ],
    );
  }

  // Método privado para generar las filas de información (optimización)
  Widget _buildInfoRow(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 24),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8.0,
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messages App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MessageListScreen(),
    );
  }
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Message> _displayedMessages = [];
  
  // Lista de nombres
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

  // Cos del missatge
  static const body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";
  
  late List<Message> allMessages;
  final random = Random();
  
  int _currentIndex = 0;
  final int _itemsPerLoad = 10;

  @override
  void initState() {
    super.initState();
    
    // Generar 100 missatges
    allMessages = List.generate(100, (index) {
      return Message(
        names[random.nextInt(names.length)],
        body,
      );
    });
    
    // Carregar els primers missatges
    _loadMoreMessages();
    
    // Listener per al scroll infinit
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreMessages();
    }
  }

  void _loadMoreMessages() {
    if (_currentIndex < allMessages.length) {
      setState(() {
        final endIndex = (_currentIndex + _itemsPerLoad < allMessages.length) 
            ? _currentIndex + _itemsPerLoad 
            : allMessages.length;
        
        _displayedMessages.addAll(
          allMessages.sublist(_currentIndex, endIndex)
        );
        _currentIndex = endIndex;
      });
      
      print('Cargados ${_displayedMessages.length} de ${allMessages.length} mensajes');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        itemCount: _displayedMessages.length + 1,
        itemBuilder: (context, index) {
          if (index < _displayedMessages.length) {
            return _buildMessageCard(_displayedMessages[index]);
          } else {
            return _currentIndex < allMessages.length
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Sense funcionalitat
        },
        backgroundColor: const Color(0xFF007bff),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildMessageCard(Message message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.author,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message.body,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
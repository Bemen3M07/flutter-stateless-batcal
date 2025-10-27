import 'dart:math';
import 'dart:html'; // para mostrar en la web

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

void main() {
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
  const body =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

  // Llista de missatges generats aleatòriament
  final random = Random();
  final messages = List.generate(5, (index) {
    return Message(
      names[random.nextInt(names.length)], // Autor aleatori
      body, // Text del missatge: sempre el mateix
    );
  });

  // Configuració bàsica del document
  final container = DivElement()
    ..style.padding = '16px'
    ..style.fontFamily = 'Arial, sans-serif';

  document.body!
    ..style.margin = '0'
    ..style.backgroundColor = '#fafafa'
    ..append(container);

  // Funció per crear targetes
  DivElement crearCard(Message msg) {
    return DivElement()
      ..style.backgroundColor = '#e0e0e0'
      ..style.borderRadius = '12px'
      ..style.padding = '12px 16px'
      ..style.marginBottom = '10px'
      ..append(HeadingElement.h4()..text = msg.author)
      ..append(ParagraphElement()..text = msg.body);
  }

  // Control de scroll infinit
  int loaded = 0;
  const int chunkSize = 10;

  void carregarMes() {
    final next = loaded + chunkSize;
    for (int i = loaded; i < next && i < messages.length; i++) {
      container.append(crearCard(messages[i]));
    }
    loaded = next;
  }

  // Quan fas scroll fins al final, carrega més missatges
  window.onScroll.listen((_) {
    if (window.scrollY + window.innerHeight! >= document.body!.scrollHeight - 50) {
      carregarMes();
    }
  });

  // Carrega els primers missatges
  carregarMes();

  // Botó flotant (sense funcionalitat)
  final floatBtn = ButtonElement()
    ..text = '+'
    ..style.position = 'fixed'
    ..style.bottom = '20px'
    ..style.right = '20px'
    ..style.width = '50px'
    ..style.height = '50px'
    ..style.borderRadius = '50%'
    ..style.border = 'none'
    ..style.fontSize = '28px'
    ..style.backgroundColor = '#007bff'
    ..style.color = 'white'
    ..style.cursor = 'pointer'
    ..style.boxShadow = '0 2px 5px rgba(0,0,0,0.3)';

  document.body!.append(floatBtn);
}
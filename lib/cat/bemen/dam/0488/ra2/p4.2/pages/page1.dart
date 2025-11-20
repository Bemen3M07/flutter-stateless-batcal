import 'package:flutter/material.dart';
import '../providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<CounterProvider>().counter.toString(),),
          ElevatedButton(onPressed: () {
            context.read<CounterProvider>().increment();
          }, child: Text('Sumar'))
        ],
      ),
    );
  }
}
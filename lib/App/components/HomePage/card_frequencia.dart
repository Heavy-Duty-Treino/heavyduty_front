import 'package:flutter/material.dart';

class CardFrequencia extends StatefulWidget {
  const CardFrequencia({super.key});

  @override
  State<CardFrequencia> createState() => _CardFrequenciaState();
}

class _CardFrequenciaState extends State<CardFrequencia> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueAccent,
      child: SizedBox(
        height: 300,
        child: Center(child: Text('Card Frequencia')),
      ),
    );
  }
}

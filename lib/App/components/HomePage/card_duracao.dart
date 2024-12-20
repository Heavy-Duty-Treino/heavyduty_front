import 'package:flutter/material.dart';

class CardDuracao extends StatefulWidget {
  const CardDuracao({super.key});

  @override
  State<CardDuracao> createState() => _CardDuracaoState();
}

class _CardDuracaoState extends State<CardDuracao> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueAccent,
      child: SizedBox(
        height: 300,
        child: Center(child: Text('Card duração')),
      ),
    );
  }
}

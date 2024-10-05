import 'package:flutter/material.dart';

class CardHistorico extends StatefulWidget {
  const CardHistorico({super.key});

  @override
  State<CardHistorico> createState() => _CardHistoricoState();
}

class _CardHistoricoState extends State<CardHistorico> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueAccent,
      child: SizedBox(
        height: 300,
        child: Center(child: Text('Card Historico')),
      ),
    );
  }
}

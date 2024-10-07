import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/base_screem.dart';

class TreinoPage extends StatefulWidget {
  const TreinoPage({super.key});

  @override
  State<TreinoPage> createState() => _TreinoPageState();
}

class _TreinoPageState extends State<TreinoPage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreem(title: 'Treino', body: Text('Tela de treino'));
  }
}

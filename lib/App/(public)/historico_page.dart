import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/HistoricoTrenos/cardHistorico.dart';

class HisoticoPage extends StatelessWidget {
  const HisoticoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 7, 44),
      child: Column(
        children: [CardHistoricoPage()],
      ),
    );
  }
}

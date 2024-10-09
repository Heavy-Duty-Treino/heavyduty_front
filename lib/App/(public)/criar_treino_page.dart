import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/base_button.dart';
import 'package:heavyduty_front/App/components/base_screem.dart';
import 'package:heavyduty_front/App/components/card_exercicio.dart';

class CriarTreinoPage extends StatefulWidget {
  const CriarTreinoPage({super.key});

  @override
  State<CriarTreinoPage> createState() => _CriarTreinoPageState();
}

class _CriarTreinoPageState extends State<CriarTreinoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Criar novo treino'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                    title: 'Escolha um exercicio',
                    ph: 20,
                    pv: 5,
                    onPressed: () {}),
                BaseButton(
                    title: 'Criar treino', ph: 20, pv: 5, onPressed: () {})
              ],
            ),
          ]),
        ),
      ),
      body: Expanded(
        child: ListView.builder(itemBuilder: (_, __) {
          return CardExercicio();
        }),
      ),
    );
  }
}

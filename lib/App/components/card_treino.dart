import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/base_button.dart';

class CardTreino extends StatefulWidget {
  const CardTreino({super.key});

  @override
  State<CardTreino> createState() => _CardTreinoState();
}

class _CardTreinoState extends State<CardTreino> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 43, 44, 46),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Treino de costas'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BaseButton(
                    title: 'Iniciar',
                    ph: 25,
                    pv: 5,
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

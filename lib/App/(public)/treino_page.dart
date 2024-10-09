import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/base_button.dart';
import 'package:heavyduty_front/App/components/base_screem.dart';
import 'package:heavyduty_front/App/components/card_treino.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class TreinoPage extends StatefulWidget {
  const TreinoPage({super.key});

  @override
  State<TreinoPage> createState() => _TreinoPageState();
}

class _TreinoPageState extends State<TreinoPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScreem(
        title: 'Treino',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Text('Treinos'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: BaseButton(
                    title: 'Crie um treino',
                    ph: 35,
                    pv: 15,
                    onPressed: () {
                      Routefly.navigate(routePaths.criarTreino);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: const Text('Meu treinos (5)'),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: CardTreino(),
                );
              }),
            )
          ],
        ));
  }
}

// Card(
//                 color: Color.fromARGB(255, 43, 44, 46),
//                 child: SizedBox(
//                   height: 100,
//                   child: Center(child: Text('data')),
//                 ),
//               ),
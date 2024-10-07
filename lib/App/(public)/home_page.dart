import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/base_screem.dart';
import 'package:heavyduty_front/App/components/card_duracao.dart';
import 'package:heavyduty_front/App/components/card_frequencia.dart';
import 'package:heavyduty_front/App/components/card_historico.dart';
import 'package:heavyduty_front/App/components/card_volume.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreem(
        title: 'Home Page',
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Sua Atividade'),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8, bottom: 4, right: 4),
                child: CardVolume(),
              )),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 4, top: 8, bottom: 4, right: 8),
                  child: CardFrequencia(),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 4, bottom: 8, right: 4),
                  child: CardDuracao(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 4, top: 4, bottom: 8, right: 8),
                  child: CardHistorico(),
                ),
              )
            ],
          )
        ]));
  }
}

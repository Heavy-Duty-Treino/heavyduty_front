import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/card_serie.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class CardExercicio extends StatefulWidget {
  final String title;
  final bool showColum;
  final String idExercicio;

  const CardExercicio(
      {super.key,
      required this.title,
      required this.showColum,
      required this.idExercicio});

  @override
  State<CardExercicio> createState() => _CardExercicioState();
}

class _CardExercicioState extends State<CardExercicio> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.title),
              Text('Tempo de descanso: 3 min')
            ])
          ]),
          if (!widget.showColum)
            Column(
              children: [
                CardSerie(
                  idExercicio: widget.idExercicio,
                )
              ],
            )
        ],
      ),
    );
  }
}

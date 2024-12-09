import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/CriarTreino/card_serie.dart';
import 'package:heavyduty_front/App/components/ConcluirTreino/card_serie_concluido.dart';
import 'package:heavyduty_front/App/interactor/controllers/concoluirTreinoPageController.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class CardExercicio extends StatefulWidget {
  final String title;
  final bool showColum;
  final String idExercicio;
  final String image;
  final bool isPageConcluir;

  const CardExercicio(
      {super.key,
      required this.title,
      required this.showColum,
      required this.idExercicio,
      required this.image,
      required this.isPageConcluir});

  @override
  State<CardExercicio> createState() => _CardExercicioState();
}

class _CardExercicioState extends State<CardExercicio> {
  final ConcoluirTreinoPageController _controller =
      Get.put(ConcoluirTreinoPageController());

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
                child: Image(image: NetworkImage(widget.image)),
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
                if (widget.isPageConcluir)
                  CardSerieConcluido(idExercicio: widget.idExercicio)
                else
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

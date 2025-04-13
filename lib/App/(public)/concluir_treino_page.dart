import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/shared/base_button.dart';
import 'package:heavyduty_front/App/components/shared/card_exercicio.dart';
import 'package:heavyduty_front/App/interactor/controllers/concoluirTreinoPageController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class ConcluirTreinoPage extends StatefulWidget {
  const ConcluirTreinoPage({super.key});

  @override
  State<ConcluirTreinoPage> createState() => _ConcluirTreinoPageState();
}

class _ConcluirTreinoPageState extends State<ConcluirTreinoPage> {
  final ConcoluirTreinoPageController _controller =
      Get.put(ConcoluirTreinoPageController());

  String formatTime(RxInt seconds) {
    int hrs = (seconds ~/ 3600);
    int mins = ((seconds % 3600) ~/ 60);
    int secs = (seconds % 60).toInt();

    return '${hrs.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.stopTimer();
    _controller.start.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                    title: "Voltar",
                    ph: 10,
                    pv: 10,
                    onPressed: () => {Routefly.navigate(routePaths.treino)}),
                Obx(() => Text(formatTime(_controller.start))),
                BaseButton(
                    title: "Concluir",
                    ph: 10,
                    pv: 10,
                    onPressed: () => {_controller.concluir()}),
              ],
            ),
          )),
      body: Column(
        children: [
          Expanded(child: Obx(
            () {
              return ListView.builder(
                  itemCount: _controller.treino.value.exercicios.length,
                  itemBuilder: (context, index) {
                    var exercicio = _controller.treino.value.exercicios[index];
                    _controller.setExercicio(exercicio.exercicioId);
                    return CardExercicio(
                      title: exercicio.nomeExercicio,
                      showColum: false,
                      idExercicio: exercicio.exercicioId,
                      isPageConcluir: true,
                      image: exercicio.imageUrl,
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}

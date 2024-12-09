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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                BaseButton(
                    title: "Voltar",
                    ph: 10,
                    pv: 10,
                    onPressed: () => {Routefly.navigate(routePaths.treino)}),
                Text('Treinamento'),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/ExercicioPage/ModalButtonExercicios.dart';
import 'package:heavyduty_front/App/components/shared/base_button.dart';
import 'package:heavyduty_front/App/components/shared/card_exercicio.dart';
import 'package:heavyduty_front/App/interactor/controllers/criarTreinoPageController.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class ExerciciosPage extends StatefulWidget {
  const ExerciciosPage({super.key});

  @override
  State<ExerciciosPage> createState() => _ExerciciosPageState();
}

class _ExerciciosPageState extends State<ExerciciosPage> {
  final Exerciciocontroller exercicioController =
      Get.put(Exerciciocontroller());
  var exercicios = <ExercicioModel>[];

  void selectExercicio() {
    Routefly.pop(context, result: exercicios);
  }

  @override
  Widget build(BuildContext context) {
    exercicioController.getAllExercicios();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um exercicio'),
        actions: <Widget>[
          BaseButton(
              title: 'Adicionar Exercicios',
              ph: 20,
              pv: 5,
              onPressed: selectExercicio)
        ],
      ),
      body: Obx(() {
        final exerciciosFiltrados = exercicioController.exercicios
            .where((ex) =>
                ex.musculo_alvo.contains(exercicioController.filtro.value))
            .toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ModalButtonExercicios(
                controller: exercicioController,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: exerciciosFiltrados.length,
                  itemBuilder: (contex, index) {
                    final exercicio = exerciciosFiltrados[index];
                    return InkWell(
                      onTap: () {
                        exercicios.add(exercicio);
                      },
                      child: CardExercicio(
                        title: exercicio.nome_exercicio,
                        showColum: true,
                        isPageConcluir: false,
                        idExercicio: exercicio.id,
                        image: exercicio.image_Url,
                      ),
                    );
                  }),
            )
          ],
        );
      }),
    );
  }
}

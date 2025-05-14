import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/components/HistoricoTrenos/cardHistorico.dart';
import 'package:heavyduty_front/App/interactor/controllers/historicoPageController.dart';

class HisoticoPage extends StatelessWidget {
  const HisoticoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoricoPageController controller =
        Get.put(HistoricoPageController());
    return Container(
      color: const Color.fromARGB(255, 0, 7, 44),
      child: Obx(() {
        return ListView.builder(
            itemCount: controller.treinosConcluidos.length,
            itemBuilder: (contex, index) {
              final treinos = controller.treinosConcluidos[index];

              return CardHistoricoPage(
                data: "data",
                title: treinos.titulo,
                equipment: "teste",
                image: treinos.fotoPerfilUsuario,
                muscleSynergist:
                    treinos.exercicios.first.musculosSinergistas.first,
                muscleTarget: treinos.exercicios.first.musculoAlvo,
                nameExercise: treinos.exercicios.first.nomeExercicio,
                nameUser: treinos.nomeUsuario,
                profileImage: treinos.fotoPerfilUsuario,
                restTime: treinos.duracao,
              );
            });
      }),
    );
  }
}

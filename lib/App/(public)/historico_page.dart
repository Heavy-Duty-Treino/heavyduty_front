import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/HistoricoTrenos/cardHistorico.dart';
import 'package:heavyduty_front/App/components/shared/base_screem.dart';
import 'package:heavyduty_front/App/interactor/controllers/historicoPageController.dart';

class HisoticoPage extends StatelessWidget {
  const HisoticoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoricoPageController controller =
        Get.put(HistoricoPageController());
    return BaseScreem(
        title: "Historico Page",
        body: Container(
          color: const Color.fromARGB(255, 0, 7, 44),
          child: Obx(() {
            return ListView.builder(
                itemCount: controller.treinosConcluidos.length,
                itemBuilder: (contex, index) {
                  final treinos = controller.treinosConcluidos[index];
                  return CardHistoricoPage(
                    data: treinos.dataCriacao,
                    title: treinos.titulo,
                    nameUser: treinos.nomeUsuario,
                    profileImage: treinos.fotoPerfilUsuario,
                    restTime: treinos.duracao,
                    exercices: treinos.exercicios,
                  );
                });
          }),
        ));
  }
}

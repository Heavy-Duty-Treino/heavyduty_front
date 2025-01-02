import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';

void main() {
  test('get all treinos', () async {
    final service = TreinoServices();
    var treinos = await service.getAll("heavyduty@gmail.com");
    expect(treinos.isNotEmpty, true);
  });

  test('create treino', () async {
    final service = TreinoServices();
    final Exerciciocontroller controller = Get.put(Exerciciocontroller());
    var treinoModel = Treino(
        id: null,
        titulo: 'titulo',
        nomeUsuario: 'nomeUsuario',
        fotoPerfilUsuario: 'fotoPerfilUsuario',
        exercicios: controller.selectedExercicios);
    service.Create(treinoModel);
  });
}

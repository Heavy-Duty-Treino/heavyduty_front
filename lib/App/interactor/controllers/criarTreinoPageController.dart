import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class Criartreinopagecontroller extends GetxController {
  final Exerciciocontroller excontroller = Get.put(Exerciciocontroller());
  final LoginPageController loginController = Get.put(LoginPageController());
  final service = TreinoServices();

  Future<void> CreateTreino(String title) async {
    var email = await loginController.getEmail();

    var treino = Treino(
        id: null,
        titulo: title,
        nomeUsuario: email,
        fotoPerfilUsuario: 'http:heavyduty.com',
        exercicios: excontroller.selectedExercicios);
    var response = await service.Create(treino);
    if (response.statusCode == 200) {
      excontroller.clear();
      Routefly.navigate(routePaths.treino);
    }
  }
}

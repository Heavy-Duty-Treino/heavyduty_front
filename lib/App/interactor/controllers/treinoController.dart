import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';

class Treinocontroller {
  final service = TreinoServices();
  final login = LoginPageController();
  final treinos = <Treino>[].obs;

  Future<void> GetAll() async {
    var email = await login.getName();
    var result = await service.getAll(email!);
    treinos.assignAll(result);
  }

  int TreinosCount() {
    return treinos.length;
  }
}

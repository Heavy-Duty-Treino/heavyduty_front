import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';

class Treinocontroller {
  final service = TreinoServices();
  final treinos = <Treino>[].obs;

  Future<void> GetAll() async {
    var result = await service.getAll();
    treinos.assignAll(result);
  }

  int TreinosCount() {
    return treinos.length;
  }
}

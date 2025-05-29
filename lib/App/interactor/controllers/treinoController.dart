import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Treinocontroller {
  final service = TreinoServices();
  final treinos = <Treino>[].obs;

  Future<void> GetAll() async {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("authUserEmail");
    var result = await service.getAll(email!);
    treinos.assignAll(result);
  }

  int TreinosCount() {
    return treinos.length;
  }
}

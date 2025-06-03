import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_concluido_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_concluido_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricoPageController extends GetxController {
  var service = TreinoConcluidoService();
  var treinosConcluidos = <TreinoConcluido>[].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    getAllTreinosConcluidos();
  }

  Future<void> getAllTreinosConcluidos() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    try {
      var email = prefs.getString("authUserEmail");
      final result = await service.getAll(email!);
      treinosConcluidos.assignAll(result);
    } catch (e) {
      print("Erro: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_concluido_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_concluido_service.dart';

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
    try {
      final result = await service.getAll();
      treinosConcluidos.assignAll(result);
    } catch (e) {
      print("Erro: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

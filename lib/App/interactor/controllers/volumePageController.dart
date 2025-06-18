import 'dart:math';

import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/user_services.dart';

class VolumePageController extends GetxController {
  final userServices = UserServices();
  var peito = 0.obs;
  var costas = 0.obs;
  var pernas = 0.obs;
  var ombros = 0.obs;
  var biceps = 0.obs;
  var triceps = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVolumeData();
  }

  Future<void> fetchVolumeData() async {
    try {
      final response = await userServices.getChartData();
      var data = response.data;
      peito.value = data["peito"] ?? 0;
      costas.value = data["costas"] ?? 0;
      pernas.value = data["quadriceps"] ?? 0;
      ombros.value = data["ombros"] ?? 0;
      biceps.value = data["biceps"] ?? 0;
      triceps.value = data["triceps"] ?? 0;
    } catch (e) {
      print(Response(statusCode: 500, statusText: "Erro ao buscar dados"));
    }
  }
}

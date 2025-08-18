import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/user_services.dart';

class VolumePageController extends GetxController {
  final userServices = UserServices();
  var peito = 0.obs;
  var costas = 0.obs;
  var quadriceps = 0.obs;
  var posterior = 0.obs;
  var ombros = 0.obs;
  var triceps = 0.obs;
  var biceps = 0.obs;
  var panturrilha = 0.obs;
  var abdomen = 0.obs;
  var anteBraco = 0.obs;
  var gluteos = 0.obs;

  late Map<String, RxInt> gruposMusculares;

  @override
  void onInit() {
    super.onInit();
    gruposMusculares = {
      'Peito': peito,
      'Costas': costas,
      'Quadríceps': quadriceps,
      'Posterior': posterior,
      'Ombros': ombros,
      'Tríceps': triceps,
      'Bíceps': biceps,
      'Panturrilha': panturrilha,
      'Abdômen': abdomen,
      'Antebraço': anteBraco,
      'Glúteos': gluteos,
    };
    fetchVolumeData();
  }

  Future<void> fetchVolumeData() async {
    try {
      final response = await userServices.getChartData();
      var data = response.data;
      peito.value = data["peito"] ?? 0;
      costas.value = data["costas"] ?? 0;
      quadriceps.value = data["quadriceps"] ?? 0;
      ombros.value = data["ombros"] ?? 0;
      biceps.value = data["biceps"] ?? 0;
      triceps.value = data["triceps"] ?? 0;
      panturrilha.value = data["panturrilha"] ?? 0;
      abdomen.value = data["abdomen"] ?? 0;
      anteBraco.value = data["antebraco"] ?? 0;
      posterior.value = data["posterior"] ?? 0;
      gluteos.value = data["gluteos"] ?? 0;
    } catch (e) {
      print(Response(statusCode: 500, statusText: "Erro ao buscar dados"));
    }
  }

  Map<String, double> get volumePorGrupo {
    return gruposMusculares.map((grupo, valor) {
      return MapEntry(grupo, valor.value.toDouble());
    });
  }

  final List<Color> cores = const [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.amber,
    Colors.purple,
    Colors.red,
    Colors.cyan,
    Colors.teal,
    Colors.pink,
    Colors.brown,
    Colors.indigo,
    Colors.lime,
  ];

  List<GrupoVolume> get gruposComVolume {
    final entries = gruposMusculares.entries.toList();
    return List.generate(entries.length, (i) {
      final entry = entries[i];
      return GrupoVolume(
        entry.key,
        entry.value.value.toDouble(),
        cores[i % cores.length],
      );
    });
  }
}

class GrupoVolume {
  final String nome;
  final double valor;
  final Color cor;

  GrupoVolume(this.nome, this.valor, this.cor);
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/components/shared/base_screem.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/App/interactor/controllers/volumePageController.dart';

class VolumePage extends StatelessWidget {
  const VolumePage({super.key});

  final Map<String, double> volumePorGrupo = const {
    'Peito': 18,
    'Costas': 14,
    'Quadriceps': 11,
    'Ombros': 8,
    'Bíceps': 6,
    'Tríceps': 5,
  };

  final List<Color> cores = const [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.amber,
    Colors.purple,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final VolumePageController _controller =
        Get.put<VolumePageController>(VolumePageController());

    final Map<String, RxInt> exerciciosPorGrupo = {
      'Peito': _controller.peito,
      'Costas': _controller.costas,
      'Quadriceps': _controller.pernas,
      'Ombros': _controller.ombros,
      'Bíceps': _controller.biceps,
      'Tríceps': _controller.triceps,
    };

    return BaseScreem(
      title: 'Volume Page',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Volume por Grupo Muscular',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300, // Ajuste conforme necessário
              child: RotatedBox(
                quarterTurns: 1, // Rotaciona o gráfico
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: 20,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60,
                          getTitlesWidget: (value, meta) {
                            final keys = volumePorGrupo.keys.toList();
                            if (value.toInt() >= 0 &&
                                value.toInt() < keys.length) {
                              return RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  keys[value.toInt()],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          interval: 1,
                        ),
                      ),
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(show: false),
                    barGroups: List.generate(volumePorGrupo.length, (index) {
                      final key = volumePorGrupo.keys.elementAt(index);
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: volumePorGrupo[key]!,
                            color: cores[index],
                            width: 20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Detalhe',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Muscugrup',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Exercicios',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
            const Divider(color: Colors.grey),
            ...exerciciosPorGrupo.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key,
                        style: const TextStyle(color: Colors.white)),
                    Obx(() => Text(entry.value.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

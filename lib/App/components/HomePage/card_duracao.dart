import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';

class CardDuracao extends StatefulWidget {
  const CardDuracao({super.key});

  @override
  State<CardDuracao> createState() => _CardDuracaoState();
}

String formatTime(RxDouble seconds) {
  int hrs = seconds.value ~/ 3600;
  int mins = (seconds.value % 3600) ~/ 60;

  if (hrs > 0 && mins > 0) {
    return '${hrs}h e ${mins}min';
  } else if (hrs > 0 && mins == 0) {
    return '${hrs}h';
  } else {
    return '${mins}min';
  }
}

class _CardDuracaoState extends State<CardDuracao> {
  final controller = Get.find<LoginPageController>();
  @override
  Widget build(BuildContext context) {
    controller
        .GetAverageHours(); // cuidado pra não chamar isso no build repetidamente
    return Obx(() {
      if (controller.average.value == 0) {
        // Não tem treino na semana
        return const Card(
          color: Color.fromARGB(255, 0, 7, 44),
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nenhum treino registrado',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Você ainda não registrou nenhum treino nesta semana.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      }

      // Tem treino: exibe o gráfico e média
      return Card(
        color: const Color.fromARGB(255, 0, 7, 44),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Média',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.access_time, color: Colors.white54, size: 30)
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              formatTime(controller.average),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: const FlTitlesData(show: false),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 1),
                        FlSpot(1, 2),
                        FlSpot(2, 1.3),
                        FlSpot(3, 1.3),
                        FlSpot(4, 2),
                      ],
                      isCurved: true,
                      color: Colors.white24,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white70,
                          strokeWidth: 0,
                        ),
                      ),
                      barWidth: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

// Text(
//               'Média: ${formatTime(controller.average)}',
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ))

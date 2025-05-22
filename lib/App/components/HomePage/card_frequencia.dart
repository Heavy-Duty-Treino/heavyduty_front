import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';

class CardFrequencia extends StatefulWidget {
  const CardFrequencia({
    super.key,
  });

  @override
  State<CardFrequencia> createState() => _CardFrequenciaState();
}

class _CardFrequenciaState extends State<CardFrequencia> {
  final controller = Get.find<LoginPageController>();

  // Constantes e estilos
  static const _maxY = 10.0;
  static const _cardColor = Color.fromARGB(255, 0, 7, 44);
  static const _textStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  // Gradiente para as barras
  static const _barsGradient = LinearGradient(
    colors: [Colors.cyan, Colors.cyanAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  void initState() {
    super.initState();
    controller.setBarData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      debugPrint('BarData atual: ${controller.barData.length} elementos');
      return Card(
        color: _cardColor,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Stack(children: [
            const Text(
              "Frequencia",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            BarChart(
              BarChartData(
                barGroups: controller.barData,
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barTouchData: BarTouchData(enabled: false),
                titlesData: const FlTitlesData(
                  show: true,
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                    ),
                  ),
                ),
                maxY: _maxY,
              ),
            ),
          ]),
        ),
      );
    });
  }
}

// Função para gerar os títulos dos meses
Widget getTitles(double value, TitleMeta meta) {
  final now = DateTime.now();
  final currentMonth = now.month - 1;
  int monthIndex = (currentMonth - (5 - value.toInt())) % 12;

  String text = _getMonthAbbreviation(monthIndex);

  return SideTitleWidget(
    space: 4,
    axisSide: meta.axisSide,
    child: Text(text, style: _CardFrequenciaState._textStyle),
  );
}

String _getMonthAbbreviation(int monthIndex) {
  switch (monthIndex) {
    case 0:
      return 'Jan';
    case 1:
      return 'Fev';
    case 2:
      return 'Mar';
    case 3:
      return 'Abr';
    case 4:
      return 'Mai';
    case 5:
      return 'Jun';
    case 6:
      return 'Jul';
    case 7:
      return 'Ago';
    case 8:
      return 'Set';
    case 9:
      return 'Out';
    case 10:
      return 'Nov';
    case 11:
      return 'Dez';
    default:
      return '';
  }
}

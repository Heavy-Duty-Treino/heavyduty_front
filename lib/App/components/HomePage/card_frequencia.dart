import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CardFrequencia extends StatefulWidget {
  const CardFrequencia({super.key});

  @override
  State<CardFrequencia> createState() => _CardFrequenciaState();
}

class _CardFrequenciaState extends State<CardFrequencia> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueAccent,
        child: Container(
          height: 300,
          child: BarChart(BarChartData(
              barGroups: barGroups,
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
                          showTitles: true, getTitlesWidget: getTitles))),
              maxY: 10)),
        ));
  }
}

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Jan';
      break;
    case 1:
      text = 'Fev';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Abr';
      break;
    case 4:
      text = 'Mai';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
      break;
    case 7:
      text = 'Ago';
      break;
    case 8:
      text = 'Set';
      break;
    case 9:
      text = 'Out';
      break;
    case 10:
      text = 'Nov';
      break;
    case 11:
      text = 'Dez';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    space: 4,
    axisSide: meta.axisSide,
    child: Text(text, style: style),
  );
}

LinearGradient get _barsGradient => LinearGradient(
      colors: [
        Colors.cyan,
        Colors.cyanAccent,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 8,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 5,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 10,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 9,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 8,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: 10,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 7,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 8,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 9,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 10,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      ),
      BarChartGroupData(
        x: 11,
        barRods: [
          BarChartRodData(
            toY: 4,
            gradient: _barsGradient,
          )
        ],
      )
    ];

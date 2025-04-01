import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';

class CardVolume extends StatefulWidget {
  const CardVolume({super.key});

  @override
  State<CardVolume> createState() => _CardVolumeState();
}

class _CardVolumeState extends State<CardVolume> {
  final LoginPageController _controller = Get.find<LoginPageController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.setChatData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[900],
      child: Container(
        height: 300,
        child: Obx(() {
          if (_controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return PieChart(
            PieChartData(
              centerSpaceRadius: 0,
              sections: _controller.sectionVolume,
            ),
          );
        }),
      ),
    );
  }
}

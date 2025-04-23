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
      color: const Color.fromARGB(255, 0, 7, 44),
      child: Container(
        height: 300,
        child: Obx(() {
          if (_controller.isLoading.value) {
            return Column(
              children: [
                Text(
                  "Volume",
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ],
            );
          }
          return Stack(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Volume",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            PieChart(
              PieChartData(
                centerSpaceRadius: 0,
                sections: _controller.sectionVolume,
              ),
            )
          ]);
        }),
      ),
    );
  }
}

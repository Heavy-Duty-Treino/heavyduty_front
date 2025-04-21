import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';

class CardHistorico extends StatefulWidget {
  const CardHistorico({super.key});

  @override
  State<CardHistorico> createState() => _CardHistoricoState();
}

class _CardHistoricoState extends State<CardHistorico> {
  final controller = Get.find<LoginPageController>();
  @override
  Widget build(BuildContext context) {
    controller.GetHistoryUser();
    return Obx(
      () => Card(
        color: Colors.blueAccent,
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Card Historico'),
                  Icon(Icons.history, color: Colors.white)
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.trainCounts}',
                        textAlign: TextAlign.left,
                      ),
                      Text("Treinos registrados")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

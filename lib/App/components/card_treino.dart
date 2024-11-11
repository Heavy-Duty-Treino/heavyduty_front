import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/base_button.dart';
import 'package:heavyduty_front/App/interactor/controllers/concoluirTreinoPageController.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class CardTreino extends StatefulWidget {
  final String title;
  final Treino treino;
  const CardTreino({super.key, required this.title, required this.treino});

  @override
  State<CardTreino> createState() => _CardTreinoState();
}

class _CardTreinoState extends State<CardTreino> {
  final ConcoluirTreinoPageController _controller =
      Get.put(ConcoluirTreinoPageController());
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 43, 44, 46),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BaseButton(
                    title: 'Iniciar',
                    ph: 25,
                    pv: 5,
                    onPressed: () {
                      Routefly.navigate(routePaths.concluirTreino);
                      _controller.setTreino(widget.treino);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

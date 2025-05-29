import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class CardSerie extends StatefulWidget {
  final String idExercicio;
  const CardSerie({super.key, required this.idExercicio});

  @override
  State<CardSerie> createState() => _CardSerieState();
}

class _CardSerieState extends State<CardSerie> {
  final Exerciciocontroller controller = Get.put(Exerciciocontroller());

  List<TableRow> series = [
    TableRow(children: [
      Container(
        child: const Text('Serie'),
      ),
      Container(
        child: const Text('KG'),
      ),
      Container(
        child: const Text('Repetições'),
      )
    ]),
  ];

  void AddSerie() {
    int nextSerierNumber = series.length;
    setState(() {
      series.add(TableRow(children: [
        Container(
            child: Obx(
          () => TextButton(
              onPressed: () {
                modalButton(context, nextSerierNumber - 1);
              },
              child: Text(controller.GetTypeSerie(
                  widget.idExercicio, nextSerierNumber - 1))),
        )),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            controller.addSerieValue(widget.idExercicio, nextSerierNumber - 1,
                null, int.tryParse(value), null);
          },
        ),
        TextField(
          onChanged: (value) {
            controller.addSerieValue(widget.idExercicio, nextSerierNumber - 1,
                null, null, int.tryParse(value));
          },
        ),
      ]));
    });
    controller.addNewSerie(widget.idExercicio, nextSerierNumber.toString());
  }

  void modalButton(context, int index) {
    int serieValue = index + 1;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                AppBar(
                  leading: null,
                  automaticallyImplyLeading: false,
                  title: const Center(child: Text('Selecione o tipo da Série')),
                ),
                ListTile(
                    leading: const Icon(Icons.music_note),
                    title: const Text('Série Aquecimento'),
                    onTap: () => {
                          controller.addSerieValue(widget.idExercicio, index,
                              'Aquecimento', null, null)
                        }),
                ListTile(
                  leading: const Icon(Icons.videocam),
                  title: const Text('Série Normal'),
                  onTap: () => {
                    controller.addSerieValue(widget.idExercicio, index,
                        serieValue.toString(), null, null)
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.satellite),
                  title: const Text('Série Drop-Set'),
                  onTap: () => {
                    controller.addSerieValue(
                        widget.idExercicio, index, 'DropSet', null, null)
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Remover Série'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          children: series,
        ),
        ElevatedButton(
            onPressed: AddSerie, child: const Text('Adicionar Serie'))
      ],
    );
  }
}

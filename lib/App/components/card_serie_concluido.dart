import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/concoluirTreinoPageController.dart';

class CardSerieConcluido extends StatefulWidget {
  final String idExercicio;
  const CardSerieConcluido({super.key, required this.idExercicio});

  @override
  State<CardSerieConcluido> createState() => _CardSerieConcluidoState();
}

class _CardSerieConcluidoState extends State<CardSerieConcluido> {
  final ConcoluirTreinoPageController _controller =
      Get.put(ConcoluirTreinoPageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: DataTable(
              columns: const [
                DataColumn(
                    label: Text(
                  "Tipo",
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  "Peso",
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  "Repetições",
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Icon(
                  Icons.verified,
                  color: Colors.white,
                ))
              ],
              rows: List<DataRow>.generate(
                _controller.exercicios
                    .firstWhere((e) => e.exercicioId == widget.idExercicio)
                    .series
                    .length,
                (index) {
                  var serie = _controller.exercicios
                      .firstWhere((e) => e.exercicioId == widget.idExercicio)
                      .series[index];
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(serie.tipoSerie)),
                      DataCell(TextField(
                        decoration:
                            InputDecoration(hintText: serie.pesoKg.toString()),
                      )),
                      DataCell(TextField(
                        decoration: InputDecoration(
                            hintText: serie.repeticoes.toString()),
                      )),
                      DataCell(Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                      ))
                    ],
                  );
                },
              ),
            )),
        ElevatedButton(
            onPressed: () {
              _controller.addSerie(widget.idExercicio);
            },
            child: Text('Adicionar Serie'))
      ],
    );
  }
}

// // class CardSerieConcluido extends StatelessWidget {
//   final String idExercicio;
//   const CardSerieConcluido({super.key, required this.idExercicio});

//   void AddSerie() {}

//   @override
//   Widget build(BuildContext context) {
//     var series = _controller.setSeries(idExercicio);

//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           child: Obx(
//             () => DataTable(
//                 columns: const [
//                   DataColumn(label: Text("Tipo")),
//                   DataColumn(label: Text("Peso")),
//                   DataColumn(label: Text("Repetições")),
//                 ],
//                 rows: _controller.series.map((serie) {
//                   return DataRow(
//                     cells: <DataCell>[
//                       DataCell(Text(serie.tipoSerie)),
//                       DataCell(Text(serie.pesoKg.toString())),
//                       DataCell(Text(serie.repeticoes.toString())),
//                     ],
//                   );
//                 }).toList()),
//           ),
//         ),
//         ElevatedButton(
//             onPressed: () {
//               _controller.addSerie(idExercicio);
//             },
//             child: Text('Adicionar Serie'))
//       ],
//     );
//   }
// }

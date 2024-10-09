import 'package:flutter/material.dart';

class CardExercicio extends StatefulWidget {
  const CardExercicio({super.key});

  @override
  State<CardExercicio> createState() => _CardExercicioState();
}

class _CardExercicioState extends State<CardExercicio> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Remada Curvada'),
              Text('data'),
              Text('Tempo de descanso: 3 min')
            ])
          ]),
          Column(
            children: [
              Table(
                children: [
                  TableRow(children: [
                    Container(
                      child: Text('Serie'),
                    ),
                    Container(
                      child: Text('KG'),
                    ),
                    Container(
                      child: Text('Repetições'),
                    )
                  ]),
                  TableRow(children: [
                    Container(
                      child: Text('data'),
                    ),
                    Container(
                      child: Text('data'),
                    ),
                    Container(
                      child: Text('data'),
                    ),
                  ])
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardHistoricoPage extends StatelessWidget {
  final String title;
  final String image;
  final String data;
  final String nameUser;
  final String profileImage;
  final String nameExercise;
  final String muscleTarget;
  final String muscleSynergist;
  final String equipment;
  final int restTime;

  const CardHistoricoPage(
      {super.key,
      required this.title,
      required this.image,
      required this.data,
      required this.nameUser,
      required this.profileImage,
      required this.nameExercise,
      required this.muscleTarget,
      required this.muscleSynergist,
      required this.equipment,
      required this.restTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Grupo: ícone + nome
              Row(
                children: [
                  Icon(Icons.account_circle, size: 50),
                  SizedBox(width: 8), // espaçamento entre ícone e texto
                  Text("Nome do Usuário"),
                ],
              ),
              Text(data),
            ],
          ),
          Text(title),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[900]),
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(nameExercise),
              const SizedBox(
                height: 12,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Musculo Alvo: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: muscleTarget,
                    style: const TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Musculo Sinergista: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: muscleSynergist,
                    style: const TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Equipamento: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: equipment,
                    style: const TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Descanso: ", style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: restTime.toString(),
                    style: const TextStyle(color: Colors.lightBlue))
              ])),
              Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}

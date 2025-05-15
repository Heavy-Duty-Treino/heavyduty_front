import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

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
  final List<Exercicio> exercices;
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
      required this.restTime,
      required this.exercices});

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
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: exercices.length,
              itemBuilder: (context, index) {
                final exercicio = exercices[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercicio.nomeExercicio,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text("Musculo Alvo: ${exercicio.musculoAlvo}",
                          style: const TextStyle(color: Colors.white)),
                      Text(
                          "Sinergistas: ${exercicio.musculosSinergistas.join(', ')}",
                          style: const TextStyle(color: Colors.white)),
                      Text("Equipamento: ${exercicio.tipoExercicio}",
                          style: const TextStyle(color: Colors.white)),
                      Text("Descanso: ${exercicio.descansoSegundos}s",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

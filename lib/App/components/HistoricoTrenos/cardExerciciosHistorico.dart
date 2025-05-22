import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class CardexerciciosPage extends StatelessWidget {
  final List<Exercicio> exercices;
  const CardexerciciosPage({super.key, required this.exercices});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[900],
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: exercices.map((ex) {
            return Container(
              width: 300,
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ex.nomeExercicio,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 12),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Musculo Alvo: ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: ex.musculoAlvo,
                        style: const TextStyle(color: Colors.lightBlue))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Musculo Sinergista: ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: ex.musculosSinergistas.first,
                        style: const TextStyle(color: Colors.lightBlue))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Equipamento: ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: ex.tipoExercicio,
                        style: const TextStyle(color: Colors.lightBlue))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Descanso: ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: ex.descansoSegundos.toString() + " segundos",
                        style: const TextStyle(color: Colors.lightBlue))
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Series: ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: ex.series.length.toString(),
                        style: const TextStyle(color: Colors.lightBlue))
                  ])),
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                            ex.imageUrl), // ou AssetImage se for local
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/HistoricoTrenos/cardExerciciosHistorico.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:intl/intl.dart';

class CardHistoricoPage extends StatelessWidget {
  final String title;
  final String data;
  final String nameUser;
  final String profileImage;
  final int restTime;
  final List<Exercicio> exercices;

  const CardHistoricoPage({
    super.key,
    required this.title,
    required this.data,
    required this.nameUser,
    required this.profileImage,
    required this.restTime,
    required this.exercices,
  });

  String formatarData(String dataUtc) {
    final DateTime dateTime = DateTime.parse(dataUtc).toLocal();
    final DateFormat formatter =
        DateFormat('dd-MM-yy'); // <-- 'yy' para dois dígitos
    return formatter.format(dateTime);
  }

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
                  Text(nameUser),
                ],
              ),
              Text(formatarData(data)),
            ],
          ),
          Text(title),
          CardexerciciosPage(exercices: exercices)
        ],
      ),
    );
  }
}

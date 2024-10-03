import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class TreinoConcluido {
  String id;
  Treino treinoDetalhado;

  TreinoConcluido({
    required this.id,
    required this.treinoDetalhado,
  });

  factory TreinoConcluido.fromJson(Map<String, dynamic> json) {
    return TreinoConcluido(
      id: json['id'],
      treinoDetalhado: Treino.fromJson(json['treinoDetalhado']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'treinoDetalhado': treinoDetalhado.toJson(),
    };
  }
}

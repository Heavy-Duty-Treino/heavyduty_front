import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_concluido_model.dart';

class TreinoConcluidoService {
  final urlDefault = 'http://localhost:5126/api/treinosconcluidos';
  final dio = Dio();

  Future<List<TreinoConcluido>> getAll() async {
    final response = await dio.get(urlDefault);
    final data = response.data as List;
    List<TreinoConcluido> treinosConcluidos =
        data.map((json) => TreinoConcluido.fromJson(json)).toList();
    return treinosConcluidos;
  }
}

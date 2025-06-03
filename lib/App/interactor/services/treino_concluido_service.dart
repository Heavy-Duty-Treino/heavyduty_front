import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/SharedServices.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_concluido_model.dart';

class TreinoConcluidoService {
  final Sharedservices sharedservices = Sharedservices();
  final urlDefault = '${Sharedservices().url}/api/treinosconcluidos';
  final dio = Dio();

  Future<List<TreinoConcluido>> getAll(String email) async {
    final response = await dio.get("$urlDefault/$email");
    final data = response.data as List;
    List<TreinoConcluido> treinosConcluidos =
        data.map((json) => TreinoConcluido.fromJson(json)).toList();
    return treinosConcluidos;
  }

  Future<Response<dynamic>> Create(TreinoConcluido model) async {
    final response = await dio.post(urlDefault,
        data: model.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));

    return response;
  }
}

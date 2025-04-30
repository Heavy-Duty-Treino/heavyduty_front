import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/SharedServices.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class TreinoServices {
  final Sharedservices sharedservices = Sharedservices();
  final urlDefault = '${Sharedservices().url}/api/treino';
  final dio = Dio();

  Future<List<Treino>> getAll(String email) async {
    final response = await dio.get("$urlDefault/$email");
    final data = response.data as List;
    List<Treino> treinos = data.map((json) => Treino.fromJson(json)).toList();
    return treinos;
  }

  Future<Response<dynamic>> Create(Treino model) async {
    final response = await dio.post(urlDefault,
        data: model.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    return response;
  }
}

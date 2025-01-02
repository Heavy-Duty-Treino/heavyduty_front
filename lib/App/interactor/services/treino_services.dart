import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class TreinoServices {
  final urlDefalult = 'http://192.168.1.64:5126/api/treino';
  final dio = Dio();

  Future<List<Treino>> getAll(String email) async {
    final response = await dio.get("$urlDefalult/$email");
    final data = response.data as List;
    List<Treino> treinos = data.map((json) => Treino.fromJson(json)).toList();
    return treinos;
  }

  Future<Response<dynamic>> Create(Treino model) async {
    final response = await dio.post(urlDefalult,
        data: model.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    return response;
  }
}

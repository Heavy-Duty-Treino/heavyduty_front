import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class TreinoServices {
  final urlDefalult = 'http://localhost:5126/api/treino';
  final dio = Dio();

  Future<List<Treino>> getAll() async {
    final response = await dio.get(urlDefalult);
    final data = response.data as List;
    List<Treino> treinos = data.map((json) => Treino.fromJson(json)).toList();
    return treinos;
  }
}

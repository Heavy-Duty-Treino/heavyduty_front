import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';

class ExercicioServices {
  final urlDefault = 'http://192.168.1.70:5126/api/exercicio';
  final dio = Dio();

  Future<List<ExercicioModel>> getAll() async {
    final response = await dio.get(urlDefault);
    final data = response.data as List;
    final exercicios = data
        .map((map) => ExercicioModel(
            id: map['id'],
            nome_exercicio: map['nome_Exercicio'],
            nome_usuario: map['nome_Usuario'],
            tipo_exercicio: map['tipo_Exercicio'],
            musculo_alvo: map['musculo_Alvo'],
            musculos_sinergistas: map['musculos_Sinergistas'],
            categoria_exercicio: map['categoria_Exercicio']))
        .toList();
    return exercicios;
  }
}

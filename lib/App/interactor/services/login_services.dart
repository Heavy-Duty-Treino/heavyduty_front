import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/SharedServices.dart';
import 'package:heavyduty_front/App/interactor/services/models/LoginModelDTO.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';
import 'package:heavyduty_front/App/interactor/services/models/createUser_model.dart';

class LoginServices {
  final Sharedservices sharedservices = Sharedservices();
  final urlDefault = '${Sharedservices().url}/api/usuario/login';
  final dio = Dio();

  Future<LoginModelDTO> authenticate(Login model) async {
    final response = await dio.post(urlDefault,
        data: model.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return LoginModelDTO.fromJson(response.data);
    } else {
      throw Exception('Erro inesperado: ');
    }
  }

  Future<Response<dynamic>> CreateUser(CreateuserModel model) async {
    // Cria o formulário multipart
    final formData = FormData.fromMap({
      'nome_Usuario': model.nome_Usuario,
      'email': model.email,
      'senha': model.senha,
      'Foto_Perfil': await MultipartFile.fromFile(
        model.foto_Perfil.path,
        filename: model.foto_Perfil.path.split('/').last,
      ),
    });

    // Faz a requisição POST
    final response = await dio.post(
      '${sharedservices.url}/api/usuario',
      data: formData,
      options: Options(headers: {
        'Content-Type': 'multipart/form-data',
      }),
    );

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return response;
    } else {
      throw Exception('Erro inesperado: ${response.statusCode}');
    }
  }
}

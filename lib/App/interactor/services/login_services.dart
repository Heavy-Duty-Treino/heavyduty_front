import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:heavyduty_front/App/interactor/services/models/LoginModelDTO.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';

class LoginServices {
  final urlDefault = 'http://192.168.1.66:5126/api/usuario/login';
  final dio = Dio();

  Future<LoginModelDTO> authenticate(Login model) async {
    final response = await dio.post(urlDefault,
        data: model.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    var json = LoginModelDTO.fromJson(response.data);
    return json;
  }
}

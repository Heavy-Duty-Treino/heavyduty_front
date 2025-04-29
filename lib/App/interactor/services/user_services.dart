import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/App/interactor/services/SharedServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final Sharedservices sharedservices = Sharedservices();
  final urlDefault = '${Sharedservices().url}/api/usuario/';
  final dio = Dio();

  Future<String?> GetEmail() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("authUserEmail");
  }

  Future<Response<dynamic>> getChartData() async {
    var email = await GetEmail();
    final response = await dio.get('${urlDefault}chartvolumedata/$email');
    return response;
  }

  Future<Response<dynamic>> getBarData() async {
    var email = await GetEmail();
    final response = await dio.get('${urlDefault}chartHistoryData/$email');
    return response;
  }

  Future<Response<dynamic>> getAverageHours() async {
    var email = await GetEmail();
    final response = await dio.get('${urlDefault}AverageHours/$email');
    return response;
  }

  Future<Response<dynamic>> GetUserTrainingHistory() async {
    var email = await GetEmail();
    final response =
        await dio.get('${urlDefault}GetUserTrainingHistory/$email');
    return response;
  }
}

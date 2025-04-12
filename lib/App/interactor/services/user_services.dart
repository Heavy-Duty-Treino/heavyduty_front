import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final urlDefalult = "https://heavyduty-back-1.onrender.com/api/usuario/";
  final dio = Dio();

  Future<String?> GetEmail() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("authUserEmail");
  }

  Future<Response<dynamic>> getChartData() async {
    var email = await GetEmail();
    final response = await dio.get('${urlDefalult}chartvolumedata/$email');
    return response;
  }

  Future<Response<dynamic>> getBarData() async {
    var email = await GetEmail();
    final response = await dio.get('${urlDefalult}chartHistoryData/$email');
    return response;
  }
}

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final urlDefalult = "http://192.168.1.68:5126/api/usuario/chartdata";
  final dio = Dio();

  Future<Response<dynamic>> getChartData() async {
    var prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("authUserName");

    final response = await dio.get('$urlDefalult/$email');

    return response;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';
import 'package:heavyduty_front/App/interactor/services/user_services.dart';

void main() {
  test("Login", () async {
    final services = LoginServices();
    var user = new Login(email: "testeimagem@gmail.com", password: "1234");
    var login = await services.authenticate(user);
    expect(login.data, "Usuario Autenticado");
  });

  test("Chart Data", () async {
    final services = UserServices();
    var chart = await services.getChartData();
    print(chart.data);
  });
}

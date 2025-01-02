import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  LoginServices services = LoginServices();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  void authenticate() async {
    var user = new Login(
        email: emailInput.value.text, password: passwordInput.value.text);
    try {
      var auth = await services.authenticate(user);
      saveToken(auth.token, emailInput.value.text);
      if (auth.data == 'Usuario Autenticado') {
        Routefly.navigate(routePaths.home);
      }
    } catch (e) {
      log("Erro ao realizar o login: ", error: e);
    }
  }

  Future<void> saveToken(String userToken, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("authUserToken", userToken);
    await prefs.setString("authUserName", name);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("authUserToken");
  }

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("authUserName");
  }
}

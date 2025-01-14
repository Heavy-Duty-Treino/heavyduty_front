import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';
import 'package:heavyduty_front/App/interactor/services/user_services.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  var userServices = UserServices();
  LoginServices services = LoginServices();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  var chatData = Rxn<dynamic>();
  var sectionVolume = <PieChartSectionData>[].obs;

  void authenticate() async {
    var user = new Login(
        email: emailInput.value.text, password: passwordInput.value.text);
    try {
      var auth = await services.authenticate(user);
      saveToken(auth.token, emailInput.value.text);
      if (auth.data == 'Usuario Autenticado') {
        setChatData();
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

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("authUserName");
    if (email!.isEmpty) return email;
    return "";
  }

  void setChatData() async {
    final response = await userServices.getChartData();
    chatData.value = response.data;
    generateFixedPieChartSections(chatData);
  }

  void generateFixedPieChartSections(Rxn<dynamic> data) {
    var costas = data.value['costas'];
    var peito = data.value['peito'];
    var quadriceps = data.value['quadriceps'];
    var posterior = data.value['posterior'];

    sectionVolume.assignAll([
      PieChartSectionData(
          value: costas.toDouble(),
          color: Colors.purple,
          radius: 70,
          showTitle: false,
          badgeWidget: ClipOval(
              child: Image.asset(
            "assets/costas.png",
            height: 30,
            fit: BoxFit.cover,
          )),
          badgePositionPercentageOffset: 1),
      PieChartSectionData(
          value: peito.toDouble(),
          color: Colors.blue,
          radius: 70,
          showTitle: false,
          badgeWidget: ClipOval(
              child: Image.asset(
            "assets/peitoral.jpg",
            height: 30,
            fit: BoxFit.cover,
          )),
          badgePositionPercentageOffset: 1),
      PieChartSectionData(
          value: quadriceps.toDouble(),
          color: Colors.orange,
          radius: 70,
          showTitle: false,
          badgeWidget: ClipOval(
              child: Image.asset(
            "assets/quadriceps.jpg",
            height: 30,
            fit: BoxFit.cover,
          )),
          badgePositionPercentageOffset: 1),
      PieChartSectionData(
          value: posterior.toDouble(),
          color: Colors.green,
          radius: 70,
          showTitle: false,
          badgeWidget: ClipOval(
              child: Image.asset(
            "assets/posterior.jpg",
            height: 30,
            fit: BoxFit.cover,
          )),
          badgePositionPercentageOffset: 1),
    ]);
  }
}

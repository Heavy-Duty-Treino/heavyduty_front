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
  var isLoading = false.obs;

  Future<void> preloadImages() async {
    try {
      await Future.wait([
        precacheImage(AssetImage("assets/costas.png"), Get.context!),
        precacheImage(AssetImage("assets/peitoral.jpg"), Get.context!),
        precacheImage(AssetImage("assets/quadriceps.jpg"), Get.context!),
        precacheImage(AssetImage("assets/posterior.jpg"), Get.context!),
      ]);
    } catch (e) {
      log("Erro ao pré-carregar imagens: ", error: e);
    }
  }

  void authenticate() async {
    var user = new Login(
        email: emailInput.value.text, password: passwordInput.value.text);
    try {
      var auth = await services.authenticate(user);
      saveToken(auth.token, emailInput.value.text, auth.usuario.imageUrl,
          auth.usuario.nomeUsuario);
      if (auth.data == 'Usuario Autenticado') {
        setChatData();
        Routefly.navigate(routePaths.home);
      }
    } catch (e) {
      log("Erro ao realizar o login: ", error: e);
    }
  }

  Future<void> saveToken(
      String userToken, String name, String image, String nome) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("authUserToken", userToken);
    await prefs.setString("authUserEmail", name);
    await prefs.setString("userImage", image);
    await prefs.setString("userName", nome);
  }

  Future<String> getEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString("authUserEmail");

      return (email != null && email.isNotEmpty)
          ? email
          : "Usuario desconhecido";
    } catch (e) {
      debugPrint("Erro ao obter o email: $e");
      return "erro ao carregar email";
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("authUserToken");
  }

  Future<String> getName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? nome = prefs.getString("userName");

      // Retorna o nome se não for nulo e não estiver vazio, senão retorna um valor padrão
      return (nome != null && nome.isNotEmpty) ? nome : "Usuário desconhecido";
    } catch (e) {
      debugPrint("Erro ao obter o nome do usuário: $e");
      return "Erro ao carregar";
    }
  }

  Future<String> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    var image = prefs.getString("userImage");
    if (image == null || image.isEmpty) {
      return "https://via.placeholder.com/150"; // Uma imagem padrão
    }
    return image;
  }

  void setChatData() async {
    try {
      isLoading.value = true;
      await preloadImages();
      final response = await userServices.getChartData();
      chatData.value = response.data;
      generateFixedPieChartSections(chatData);
    } catch (e) {
      log("Erro ao carregar dados do gráfico: ", error: e);
    } finally {
      isLoading.value = false;
    }
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
            width: 30,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red);
            },
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
            width: 30,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red);
            },
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
            width: 30,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red);
            },
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
            width: 30,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red);
            },
          )),
          badgePositionPercentageOffset: 1),
    ]);
  }
}

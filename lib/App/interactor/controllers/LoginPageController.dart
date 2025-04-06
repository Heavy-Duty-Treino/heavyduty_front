import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/HomePage/card_frequencia.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';
import 'package:heavyduty_front/App/interactor/services/user_services.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  // Serviços
  final userServices = UserServices();
  final services = LoginServices();

  // Controllers
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  // Estados reativos
  final chatData = Rxn<dynamic>();
  final barData = <BarChartGroupData>[].obs;
  final sectionVolume = <PieChartSectionData>[].obs;
  final isLoading = false.obs;

  // Constantes
  static const _gradientColors = [Colors.cyan, Colors.cyanAccent];
  static const _gradientBegin = Alignment.bottomCenter;
  static const _gradientEnd = Alignment.topCenter;

  // ================ Métodos de Autenticação ================
  void authenticate() async {
    final user = Login(
      email: emailInput.value.text,
      password: passwordInput.value.text
    );
    
    try {
      final auth = await services.authenticate(user);
      await saveToken(
        auth.token,
        emailInput.value.text,
        auth.usuario.imageUrl,
        auth.usuario.nomeUsuario
      );
      
      if (auth.data == 'Usuario Autenticado') {
        await loadData();
        Routefly.navigate(routePaths.home);
      }
    } catch (e) {
      log("Erro ao realizar o login: ", error: e);
    }
  }

  Future<void> saveToken(
    String userToken,
    String email,
    String image,
    String nome
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setString("authUserToken", userToken),
      prefs.setString("authUserEmail", email),
      prefs.setString("userImage", image),
      prefs.setString("userName", nome),
    ]);
  }

  // ================ Métodos de Dados do Usuário ================
  Future<String> getEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString("authUserEmail");
      return (email != null && email.isNotEmpty) ? email : "Usuario desconhecido";
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
      final nome = prefs.getString("userName");
      return (nome != null && nome.isNotEmpty) ? nome : "Usuário desconhecido";
    } catch (e) {
      debugPrint("Erro ao obter o nome do usuário: $e");
      return "Erro ao carregar";
    }
  }

  Future<String> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    final image = prefs.getString("userImage");
    return (image == null || image.isEmpty) 
      ? "https://via.placeholder.com/150"
      : image;
  }

  // ================ Métodos de Carregamento de Dados ================
  Future<void> loadData() async {
    await Future.wait([
      setChatData(),
      setBarData(),
    ]);
  }

  Future<void> setChatData() async {
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

  Future<void> setBarData() async {
    try {
      isLoading.value = true;
      debugPrint('Iniciando setBarData...');
      debugPrint('Chamando userServices.getBarData()...');
      
      final response = await userServices.getBarData();
      debugPrint('Resposta recebida do getBarData: ${response.data}');
      debugPrint('Tipo da resposta: ${response.data.runtimeType}');
      
      barData.value = getBarGroups(response.data);
      debugPrint('BarData atualizado com sucesso. Quantidade de elementos: ${barData.length}');
    } catch (e) {
      log("Erro ao carregar dados do gráfico: ", error: e);
      debugPrint('Erro detalhado: $e');
    } finally {
      isLoading.value = false;
      debugPrint('setBarData finalizado');
    }
  }

  // ================ Métodos de Pré-carregamento ================
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

  // ================ Métodos de Geração de Gráficos ================
  void generateFixedPieChartSections(Rxn<dynamic> data) {
    final costas = data.value['costas'];
    final peito = data.value['peito'];
    final quadriceps = data.value['quadriceps'];
    final posterior = data.value['posterior'];

    sectionVolume.assignAll([
      _createPieSection(costas, Colors.purple, "assets/costas.png"),
      _createPieSection(peito, Colors.blue, "assets/peitoral.jpg"),
      _createPieSection(quadriceps, Colors.orange, "assets/quadriceps.jpg"),
      _createPieSection(posterior, Colors.green, "assets/posterior.jpg"),
    ]);
  }

  PieChartSectionData _createPieSection(
    dynamic value,
    Color color,
    String assetPath
  ) {
    return PieChartSectionData(
      value: value.toDouble(),
      color: color,
      radius: 70,
      showTitle: false,
      badgeWidget: ClipOval(
        child: Image.asset(
          assetPath,
          height: 30,
          width: 30,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error, color: Colors.red);
          },
        ),
      ),
      badgePositionPercentageOffset: 1,
    );
  }

  List<BarChartGroupData> getBarGroups(Map<String, dynamic> dadosFrequencia) {
    final now = DateTime.now();
    final currentMonth = now.month - 1;
    List<BarChartGroupData> groups = [];

    for (int i = 0; i < 6; i++) {
      final monthIndex = (currentMonth - (5 - i)) % 12;
      final monthName = _getMonthName(monthIndex);
      final value = dadosFrequencia[monthName.toLowerCase()] ?? 0;

      groups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: value.toDouble(),
              gradient: LinearGradient(
                colors: _gradientColors,
                begin: _gradientBegin,
                end: _gradientEnd,
              ),
            ),
          ],
        ),
      );
    }

    return groups;
  }

  // ================ Métodos Auxiliares ================
  String _getMonthName(int monthIndex) {
    switch (monthIndex) {
      case 0: return 'janeiro';
      case 1: return 'fevereiro';
      case 2: return 'marco';
      case 3: return 'abril';
      case 4: return 'maio';
      case 5: return 'junho';
      case 6: return 'julho';
      case 7: return 'agosto';
      case 8: return 'setembro';
      case 9: return 'outubro';
      case 10: return 'novembro';
      case 11: return 'dezembro';
      default: return '';
    }
  }
}

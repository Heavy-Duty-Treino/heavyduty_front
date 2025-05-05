import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioController {
  Future<void> Logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Limpa todos os dados armazenados

      // Remove o controlador da memória
      Get.delete<LoginPageController>();

      // Redireciona para a tela de login
      Routefly.navigate(routePaths.login);
    } catch (e) {
      print("Erro ao realizar logout: ");
    }
  }
}

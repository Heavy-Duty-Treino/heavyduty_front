import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/createUser_model.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class CriarContaController extends GetxController {
  // Example service
  final loginServices = LoginServices();
  // Example observable variables
  var isLoading = false.obs;
  final imageFile = Rx<File?>(null);
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  // Example method to handle account creation
  void criarConta() async {
    if (username.text.isEmpty || email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar('Erro', 'Preencha todos os campos');
      return;
    }

    if (imageFile.value == null) {
      Get.snackbar('Erro', 'Selecione uma imagem de perfil');
      return;
    }

    isLoading.value = true;

    try {
      await loginServices.CreateUser(CreateuserModel(
        nome_Usuario: username.text,
        foto_Perfil: imageFile.value!,
        email: email.text,
        senha: password.text,
      ));
      print('Sucesso: Conta criada com sucesso!');
      Routefly.navigate(routePaths.login);
    } catch (e) {
      print('Erro: Falha ao criar conta - $e');
    } finally {
      isLoading.value = false;
    }
  }
}

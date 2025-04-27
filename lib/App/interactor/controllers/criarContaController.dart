import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarContaController extends GetxController {
  // Example observable variables
  var isLoading = false.obs;
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

    isLoading.value = true;

    try {
      // Simulate account creation process
      await Future.delayed(Duration(seconds: 2));
      Get.snackbar('Sucesso', 'Conta criada com sucesso!');
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao criar conta');
    } finally {
      isLoading.value = false;
    }
  }
}

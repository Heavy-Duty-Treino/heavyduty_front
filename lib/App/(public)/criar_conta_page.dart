import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/components/shared/InputField.dart';
import 'package:heavyduty_front/App/interactor/controllers/criarContaController.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({super.key});

  @override
  Widget build(BuildContext context) {
    final CriarContaController controller = Get.put(CriarContaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                'https://fakeimg.pl/100x100',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            InputField(
              textEditingController: controller.username,
              hintText: 'Nome',
              obscureText: false,
            ),
            const SizedBox(height: 16),
            InputField(
              textEditingController: controller.email,
              hintText: 'E-mail',
              obscureText: false,
            ),
            const SizedBox(height: 16),
            InputField(
              textEditingController: controller.password,
              hintText: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            InputField(
              textEditingController: controller.confirmPassword,
              hintText: 'Confirme a senha',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Ação ao criar cont
                controller.criarConta();
              },
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CriarConta(),
  ));
}

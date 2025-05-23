import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/shared/InputField.dart';
import 'package:heavyduty_front/App/interactor/controllers/criarContaController.dart';
import 'package:image_picker/image_picker.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({super.key});

  @override
  Widget build(BuildContext context) {
    final CriarContaController controller = Get.put(CriarContaController());

    Future<void> pickAndSendImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imagem = File(pickedFile.path);
        controller.imageFile.value = imagem;
      } else {
        print('Nenhuma imagem selecionada.');
      }
    }

    // Estilo padrão dos botões
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      minimumSize:
          const Size(double.infinity, 48), // Largura total no container pai
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://fakeimg.pl/100x100',
                    width: 100,
                    height: 100,
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
                ElevatedButton(
                  onPressed: pickAndSendImage,
                  style: buttonStyle,
                  child: const Text('Enviar Imagem'),
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
                  onPressed: controller.criarConta,
                  style: buttonStyle,
                  child: const Text('Criar Conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

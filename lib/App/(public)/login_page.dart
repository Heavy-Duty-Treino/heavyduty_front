import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heavyduty_front/App/(public)/concluir_treino_page.dart';
import 'package:heavyduty_front/App/components/Login/emailFiel.widget.dart';
import 'package:heavyduty_front/App/components/Login/passwordFiel.widget.dart';
import 'package:heavyduty_front/App/components/shared/base_button.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: _body(),
    );
  }

  _body() {
    final LoginPageController controller = Get.put(LoginPageController());
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(12),
        children: [
          EmailField(),
          passwordField(),
          BaseButton(
              title: "Entrar",
              ph: 48,
              pv: 10,
              onPressed: () => controller.authenticate()),
          RichText(
              text: TextSpan(
            text: "Não tem uma conta?",
            children: [
              TextSpan(
                text: " Cadastre-se",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Routefly.push(routePaths.criarConta);
                  },
              )
            ],
          ))
        ],
      ),
    );
  }
}

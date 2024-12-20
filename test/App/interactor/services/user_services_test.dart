import 'package:flutter_test/flutter_test.dart';
import 'package:heavyduty_front/App/interactor/services/login_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/Login_model.dart';

void main() {
  test("Login", () async {
    final services = LoginServices();
    var user = new Login(email: "heavyduty@gmail.com", password: "123456789");
    var login = await services.authenticate(user);
    expect(login.data, "Usuario Autenticado");
  });
}
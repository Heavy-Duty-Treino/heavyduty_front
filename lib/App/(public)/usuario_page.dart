import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/shared/base_screem.dart';
import 'package:heavyduty_front/App/interactor/controllers/usuarioController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UsuarioController controller = UsuarioController();
    const cardColor = Color.fromARGB(255, 0, 7, 44);

    return BaseScreem(
      title: 'Usuario',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Card: Editar Perfil
          Card(
            color: cardColor,
            child: ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text(
                "Editar perfil",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Lógica para editar perfil
              },
            ),
          ),
          // Card: Alterar Senha
          Card(
            color: cardColor,
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.orange),
              title: const Text(
                "Alterar senha",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Lógica para alterar senha
              },
            ),
          ),
          // Card: Configurações do Aplicativo
          Card(
            color: cardColor,
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.green),
              title: const Text(
                "Configurações do aplicativo",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Lógica para configurações do aplicativo
              },
            ),
          ),
          // Card: Sair
          Card(
            color: cardColor,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Sair",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Lógica para logout
                controller.Logout().then((_) {
                  // Redireciona para a página de login após o logout
                  Routefly.navigate(routePaths.login);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/components/shared/base_screem.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    const _cardColor = const Color.fromARGB(255, 0, 7, 44);

    return BaseScreem(
      title: 'Usuario',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Card: Editar Perfil
          Card(
            color: _cardColor,
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
            color: _cardColor,
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
            color: _cardColor,
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
            color: _cardColor,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Sair",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Lógica para logout
              },
            ),
          ),
        ],
      ),
    );
  }
}

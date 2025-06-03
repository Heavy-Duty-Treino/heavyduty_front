import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/components/shared/base_header.dart';
import 'package:heavyduty_front/App/components/shared/headerUsuario.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BaseScreem extends StatefulWidget {
  final Widget body;
  final String title;

  const BaseScreem({super.key, required this.title, required this.body});

  @override
  State<BaseScreem> createState() => _BaseScreemState();
}

class _BaseScreemState extends State<BaseScreem> {
  int _getIndexFromRoute(BuildContext context) {
    final currentPath = ModalRoute.of(context)?.settings.name;

    switch (currentPath) {
      case '/home':
        return 0; // Home
      case '/treino':
        return 1; // Treino
      case '/usuario':
        return 2; // Usuario
      default:
        return 0; // Padrão, se não encontrar, assume Home
    }
  }

  void _onTapNavigation(int index) {
    if (index == 0) Routefly.navigate(routePaths.home);
    if (index == 1) Routefly.navigate(routePaths.treino);
    if (index == 2) Routefly.navigate(routePaths.usuario);
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeDateFormatting('pt_BR', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = Get.find<LoginPageController>();
    var currentIndex = _getIndexFromRoute(context);

    // Verifica se está na página "usuario"
    final isUsuarioPage = ModalRoute.of(context)?.settings.name == '/usuario';
    final isHistoricoPage =
        ModalRoute.of(context)?.settings.name == '/historico';

    PreferredSize header(String routeName) {
      if (routeName == '/usuario') {
        return PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: BaseHeaderUsuario(
            getImage: controller.getImage,
            getName: controller.getName,
            getEmail: controller.getEmail,
          ),
        );
      } else if (routeName == '/historico') {
        return PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: Colors.black,
            leading: BackButton(
              color: Colors.white,
              onPressed: () => Routefly.navigate(routePaths.home),
            ),
            title: const Text('Histórico'),
            centerTitle: true,
          ),
        );
      } else {
        return PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: BaseHeader(
            getImage: controller.getImage,
            getName: controller.getName,
          ),
        );
      }
    }

    return Scaffold(
      appBar: header(ModalRoute.of(context)?.settings.name ?? ''),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white, // cor do item selecionado
        unselectedItemColor:
            const Color.fromARGB(255, 112, 112, 112), // cor dos outros
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Treino'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        onTap: _onTapNavigation,
      ),
    );
  }
}


// actions: const [
//           Column(
//             children: [
//               Text('Nome do usuario'),
//               Text('Sexta-Feira, 04 outubro')
//             ],
//           )
//         ],
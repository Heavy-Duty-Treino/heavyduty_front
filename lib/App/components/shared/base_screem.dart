import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      default:
        return 0; // Padrão, se não encontrar, assume Home
    }
  }

  void _onTapNavigation(int index) {
    if (index == 0) Routefly.navigate(routePaths.home);
    if (index == 1) Routefly.navigate(routePaths.treino);
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeDateFormatting('pt_BR', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginPageController _controller = Get.find<LoginPageController>();
    var currentIndex = _getIndexFromRoute(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FutureBuilder<String>(
                      future: _controller.getImage(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text("Erro ao carregar imagem");
                        }

                        if (snapshot.data == null || snapshot.data!.isEmpty) {
                          return Icon(Icons.account_circle, size: 50);
                        }

                        return SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder<String>(
                            future: _controller.getName(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text("Erro ao buscar nome");
                              }
                              debugPrint(snapshot.data);
                              return Text(snapshot.data!);
                            }),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            '${toBeginningOfSentenceCase(DateFormat.EEEE('pt_BR').format(DateTime.now()))}, ${DateFormat('dd MMMM', 'pt_BR').format(DateTime.now())}',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white, // cor do item selecionado
        unselectedItemColor:
            Color.fromARGB(255, 112, 112, 112), // cor dos outros
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Treino')
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/controllers/LoginPageController.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class BaseScreem extends StatefulWidget {
  final Widget body;
  final String title;

  const BaseScreem({super.key, required this.title, required this.body});

  @override
  State<BaseScreem> createState() => _BaseScreemState();
}

class _BaseScreemState extends State<BaseScreem> {
  void _onTapNavigation(int index) {
    if (index == 0) Routefly.navigate(routePaths.home);
    if (index == 1) Routefly.navigate(routePaths.treino);
  }

  @override
  Widget build(BuildContext context) {
    final LoginPageController _controller = Get.find<LoginPageController>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Container(
            margin: const EdgeInsets.only(top: 90),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
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

                        return Image.network(snapshot.data!);
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
                          child: Text('Terca Feira, 01 Outubro'),
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
        fixedColor: const Color.fromARGB(115, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 112, 112, 112),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.note_alt_rounded,
                color: Color.fromARGB(255, 112, 112, 112),
              ),
              label: 'Treino')
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
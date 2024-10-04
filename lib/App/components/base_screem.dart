import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            margin: const EdgeInsets.only(top: 90),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nome Usuario'),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fit_screen_outlined), label: 'Treino')
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
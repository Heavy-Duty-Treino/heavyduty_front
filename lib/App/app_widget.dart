import 'package:flutter/material.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Heavy App',
      routerConfig:
          Routefly.routerConfig(routes: routes, initialPath: routePaths.splash),
    );
  }
}

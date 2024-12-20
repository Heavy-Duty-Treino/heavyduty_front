import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1A1919),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white))),
      title: 'Heavy App',
      routerConfig:
          Routefly.routerConfig(routes: routes, initialPath: routePaths.splash),
    );
  }
}

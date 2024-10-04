import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/pages/base_screem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreem(
      title: 'Home Page',
      body: Text('Texto body'),
    );
  }
}

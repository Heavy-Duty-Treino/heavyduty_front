import 'package:flutter/material.dart';

class CardVolume extends StatefulWidget {
  const CardVolume({super.key});

  @override
  State<CardVolume> createState() => _CardVolumeState();
}

class _CardVolumeState extends State<CardVolume> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueAccent,
      child: SizedBox(
        height: 300,
        child: Center(child: Text('Card Volume')),
      ),
    );
  }
}

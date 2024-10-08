import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final String title;
  final double ph;
  final double pv;

  const BaseButton(
      {super.key, required this.title, required this.ph, required this.pv});

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.title),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 1, 12, 43),
          foregroundColor: Colors.white,
          padding:
              EdgeInsets.symmetric(horizontal: widget.ph, vertical: widget.pv),
          elevation: 1,
          side: BorderSide(color: Colors.white, width: 0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: () {},
    );
  }
}

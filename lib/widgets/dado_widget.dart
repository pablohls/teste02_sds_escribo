import 'package:flutter/material.dart';

class Dado extends StatelessWidget {
  const Dado({
    Key? key,
    required this.vDado1,
  }) : super(key: key);

  final int vDado1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 80,
        child: Image.asset("assets/images/dice$vDado1.png"));
  }
}

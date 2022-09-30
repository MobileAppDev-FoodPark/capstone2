import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'a', //icon font from fontastic
      style: TextStyle(
          color: Colors.cyanAccent,
          fontSize: 100,
          fontFamily: 'untitled-font-1'),
    );
  }
}

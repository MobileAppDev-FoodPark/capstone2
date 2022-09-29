import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'a', //icon font from fontastic
      style: TextStyle(
          color: Colors.cyanAccent,
          fontSize: 100,
          fontFamily: 'untitled-font-1'),
    );
  }
}

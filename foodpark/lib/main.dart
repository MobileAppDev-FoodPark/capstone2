// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this

//import 'dart:html';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:foodpark/Pages/sign_up.dart';
import 'package:foodpark/Pages/welcomepage.dart';
import 'Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:foodpark/helpers/app_colors.dart';

import 'widgets/iconlogo.dart';

void main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 4, goToPage: WelcomePage())));
}

//logo that will appear on the splash page

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
//duration for opening
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Logo(),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unnecessary_this

//import 'package:firebase_core/firebase_core.dart';
//import 'package:foodpark/Pages/sign_up.dart';
import 'package:foodpark/widgets/iconlogo.dart';
import 'package:flutter/material.dart';

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
        child: const Logo(),
      ),

//home: SignupView(
//title: 'Food park',
    );
  }
}

// ignore_for_file: prefer_const_constructors

//import 'package:firebase_core/firebase_core.dart';
import 'package:foodpark/Pages/login_page.dart';
//import 'package:foodpark/Pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:foodpark/helpers/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.6,
                child: Image.asset('images/yellowBg.png', fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Container(
                    width: 400,
                    height: 400,
                    alignment: Alignment.center,
                    child: Image.asset('images/appLogo.png'),
                  )),
                  SizedBox(height: 10),
                  Text('Welcome to Food Park Mobile App!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 40),
                  Text('Find the nearest Food Park within your area',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Appcolors.darkershade.withOpacity(0.2),
                          highlightColor: Appcolors.cyan.withOpacity(0.2),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                          title: '',
                                        )));
                          },
                          child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Appcolors.darkershade, width: 4)),
                              child: Text(
                                'Log In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Signup Page',
      home: const SignupView(title: 'Sign Up Page'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SignupView extends StatefulWidget {
  const SignupView({super.key, required String title});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confipassword;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confipassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confipassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),

                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.cyan,
                          ),
                        ),

                        SizedBox(
                          height: 60,
                        ),

                        //Username text

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: _username,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                    hintText: 'Username',
                                    icon: Icon(Icons.person),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),

                        //Email text

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: _email,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    icon: Icon(Icons.email_outlined),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),

                        //password text

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: _password,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    icon: Icon(Icons.lock),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),

                        //Confi-password text

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                obscureText: true,
                                controller: _confipassword,
                                decoration: InputDecoration(
                                    hintText: 'Confirm-Password',
                                    icon: Icon(Icons.lock),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //login button

                        SizedBox(
                          height: 40,
                          width: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                border: Border.all(color: Colors.cyan),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextButton(
                              onPressed: () async {
                                if (passwordConfirmed()) {
                                  final email = _email.text;
                                  final password = _password.text;
                                  try {
                                    final userCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    devtools.log(userCredential.toString());
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      devtools.log('weak password');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      devtools.log('email-already-in-use');
                                    } else if (e.code == 'invalid email') {
                                      devtools.log('invalid email');
                                    }
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _confipassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}

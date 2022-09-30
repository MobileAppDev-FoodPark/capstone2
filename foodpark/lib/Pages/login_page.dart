// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpark/Pages/sign_up_business.dart';
import 'package:foodpark/Pages/sign_up.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Food park'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required String title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailControl = TextEditingController();
  final _passControl = TextEditingController();

  Future sigIn() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailControl.text.trim(),
      password: _passControl.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailControl.dispose();
    _passControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),

                Text(
                  'FOOD PARK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.cyan,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FINDING GOOD FOOD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.food_bank),
                  ],
                ),

                SizedBox(
                  height: 70,
                ),

                //emal text

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
                        controller: _emailControl,
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
                        controller: _passControl,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(Icons.lock),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                //login button

                SizedBox(
                  height: 40,
                  width: 200,
                  child: GestureDetector(
                    onTap: sigIn,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //register text

                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?',
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupView(
                                        title: '',
                                      )));
                        },
                        child: const Text('Register Here',
                            style: TextStyle(fontSize: 20)),
                      ),
                    )
                  ],
                ),
                Text('Or', style: TextStyle(fontSize: 17)),
                SizedBox(
                  height: 10,
                ),
                Text('Do you need a business account?',
                    style: TextStyle(fontSize: 17)),

                //Sign Up Here Button
                SizedBox(
                  height: 5,
                ),

                SizedBox(
                  height: 40,
                  width: 200,
                  child: GestureDetector(
                    onTap: sigIn,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BusinessAccount(
                                        title: '',
                                      )));
                        },
                        child: Text(
                          'Sign Up Here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

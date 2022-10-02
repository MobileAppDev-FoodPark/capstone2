// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodpark/Pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Signup Page-Business-Account',
      home: const BusinessAccount(title: 'Sign Up Page'),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BusinessAccount extends StatelessWidget {
  const BusinessAccount({super.key, required String title});

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
                  height: 60,
                ),

                Text(
                  'BUSINESS ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
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
                        decoration: InputDecoration(
                            hintText: 'Username',
                            icon: Icon(Icons.person),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                //Business Name Text
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
                        decoration: InputDecoration(
                            hintText: 'Business Name',
                            icon: Icon(Icons.apartment),
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
                      onPressed: () {},
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage(
                                        title: '',
                                      )));
                        },
                        child: const Text('Log In Here',
                            style: TextStyle(fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

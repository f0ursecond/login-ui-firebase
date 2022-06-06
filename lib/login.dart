import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // KONTOLER

  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;

  Future signIn() async {
    setState(() => isLoading = true);
    if (_key.currentState!.validate()) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passcontroller.text.trim(),
      );
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 85.0, left: 10.0, right: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    // child: Lottie.asset('assets/animations/coding.json'),
                    child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: Image.asset('assets/images/logosmk.jpg')),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),

                  // Textfield Nis

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: validateEmail,
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Ionicons.mail_open_outline,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // TextField Password

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _passcontroller,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                        ),
                        suffixIcon: const Icon(
                          Feather.eye_off,
                          color: Colors.black,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Feather.lock,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, left: 10.0, bottom: 10.0, top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // BUTTON
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      height: 50.0,
                      width: 150.0,
                      child: Center(
                        child: TextButton(
                          onPressed: signIn,
                          child: Center(
                            child: isLoading
                                ? const SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Email e di isi sek cok';

    return null;
  }
}

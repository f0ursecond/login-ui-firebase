import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  bool obsecureText = false;

  Future signIn() async {
    try {
      setState(() => isLoading = true);
      if (_key.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passcontroller.text.trim(),
        );
      } else {
        setState(
          () {
            Future.delayed(const Duration(seconds: 1), () {
              setState(() => isLoading = false);
            });
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      //ketika salah password

      if (e.code == 'wrong-password') {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() => isLoading = false);
          },
        );
        return showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Password salah",
            textStyle: TextStyle(color: Colors.white),
          ),
        );

        //ketika request terlalu banyak

      } else if (e.code == 'too-many-requests') {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() => isLoading = false);
          },
        );

        return showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Login Gagal, Silahkan hubungi petugas",
            textStyle: TextStyle(color: Colors.white),
          ),
        );

        //ketika email tidak terdaftar

      } else if (e.code == 'user-not-found') {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() => isLoading = false);
          },
        );

        return showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Email anda belum terdaftar, silahkan hubungi petugas",
            textStyle: TextStyle(color: Colors.white),
          ),
        );
      } else {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        height: 400,
                        width: 400,
                        child: Lottie.asset('assets/animations/welcome.json')),
                  ),
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
                  child: TextFormField(
                    validator: validatePassword,
                    controller: _passcontroller,
                    obscureText: obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        icon: obsecureText
                            ? const Icon(
                                Feather.eye_off,
                                color: Colors.black,
                              )
                            : const Icon(
                                Feather.eye,
                                color: Colors.black,
                              ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Password',
                      prefixIcon: const Icon(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Silahkan isi email terlebih dahulu';

    return null;
  }
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Silahkan isi password terlebih dahulu';
    return null;
    // } else if (formPassword == 'wrong-password') {
    //   return 'password e seng bener cok';
    //   return null;
  }
}

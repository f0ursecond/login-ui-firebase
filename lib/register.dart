import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'main.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obsecureText = true;
  bool isLoading = false;

  final _nameController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 25.h,
                width: 150.w,
                child: Lottie.asset('assets/animations/welcome.json'),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, -20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up ...',
                          style: GoogleFonts.hind(
                            // letterSpacing: 1,
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Please register!',
                          style: GoogleFonts.hind(
                            color: Colors.grey[600],
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // validator: validateEmail,
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 5, 5), width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Nama',
                  prefixIcon: Icon(
                    Ionicons.person_outline,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // validator: validateEmail,
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
                  prefixIcon: Icon(
                    Ionicons.mail_open_outline,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // validator: validatePassword,
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
                  prefixIcon: Icon(
                    Feather.lock,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                height: 6.h,
                width: 25.w,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
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
            Transform(
              transform: Matrix4.translationValues(0, -10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const loginPage())));
                    },
                    child: Text(
                      'Login',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

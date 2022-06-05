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
  //controller
  final _niscontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _kelascontroller = TextEditingController();

  String? _valKelas;
  final items = ['X AKL 1', 'X AKL 2', 'X AKL 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 125.0, left: 10.0, right: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset('assets/animations/coding.json'),
                ),
                const SizedBox(
                  height: 5.0,
                ),

                // Textfield Nis

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    height: 50.0,
                    width: double.infinity,
                    child: TextField(
                      controller: _niscontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nomor Induk Siswa',
                        prefixIcon: Icon(
                          Ionicons.school_outline,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                // TextField Password

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    height: 50.0,
                    width: double.infinity,
                    child: TextField(
                      controller: _passcontroller,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Feather.eye_off,
                          color: Colors.black,
                          size: 25,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Feather.lock,
                          size: 24,
                          color: Colors.black,
                        ),
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
                        onPressed: () {},
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top: 140.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t Have an account? ',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15.0),
        ),
      );
}

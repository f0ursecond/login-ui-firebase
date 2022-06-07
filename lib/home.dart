import 'dart:async';
import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final user = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masuk sebagai : ' + user.email!,
              style: TextStyle(fontSize: 15.0),
            ),
            const Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Divider(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    width: 250.0,
                    height: 50.0,
                    child: Center(
                      child: TextButton(
                        onPressed: (() {
                          setState(() {
                            isLoading = true;
                          });

                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              isLoading = false;
                              FirebaseAuth.instance.signOut();
                            });
                          });
                        }),
                        child: isLoading
                            ? const SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Log out',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

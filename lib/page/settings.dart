import 'dart:async';

import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;

  final List pengaturan = [
    'Privacy',
    'Change Profile Picture',
    'About this App',
    'Rating',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.elliptical(200, 40),
                //   bottomRight: Radius.elliptical(200, 40),
                // ),
              ),
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Settings',
                  style: GoogleFonts.karla(
                    color: Colors.white,
                    fontSize: 34,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0, -35, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            child: Text('XX'),
                            minRadius: 30,
                          ),
                          const VerticalDivider(),
                          Transform(
                            transform: Matrix4.translationValues(10, 8, 0),
                            child: Container(
                              // color: Colors.white,
                              height: 80,
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: ${user.displayName}'),
                                  Text('Email : ${user.email!}'),
                                  Text('Kelas : ${user.phoneNumber}')
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: pengaturan.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(pengaturan[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'App Version V2.0',
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[500]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: 135,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Do you want to log out ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      setState(() {
                                        isLoading = false;
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                  child: isLoading
                                      ? const SizedBox(
                                          height: 20.0,
                                          width: 20.0,
                                          child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        )
                                      : const Text(
                                          'Log out',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                )
                              ],
                            );
                          });
                    },
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
                              'Log out',
                              style: TextStyle(color: Colors.white),
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

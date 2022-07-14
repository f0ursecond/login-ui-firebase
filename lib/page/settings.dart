import 'dart:async';

import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    'Privacy Policy',
    'Change Profile Picture',
    'About this App',
    'Rating',
    'Term & Condition',
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
              height: 18.h,
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  height: 14.h,
                  width: 80.w,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                child: Text('XX'),
                                minRadius: 8.w,
                              ),
                            ),
                            // const VerticalDivider(),
                            Container(
                              width: 55.w,
                              height: 10.h,
                              // color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama: Rizal Ahmad Maulana',
                                    ),
                                    Text('Email: ' + user.email!),
                                    Text('Kelas: XII RPL'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
              height: 23.5.h,
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Text(
              'App Version V2.0',
              style:
                  GoogleFonts.roboto(fontSize: 12.sp, color: Colors.grey[500]),
            ),
            SizedBox(
              height: 1.h,
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
                      showAnimatedDialog(
                          animationType: DialogTransitionType.slideFromTop,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(seconds: 1),
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

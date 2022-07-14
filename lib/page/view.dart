import 'dart:async';
import 'dart:ui';

import 'package:absensi/page/absen.dart';
import 'package:absensi/login.dart';
import 'package:absensi/page/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../main.dart';
import 'package:flutter/material.dart';

class viewPage extends StatefulWidget {
  const viewPage({Key? key}) : super(key: key);

  @override
  State<viewPage> createState() => _viewPageState();
}

class _viewPageState extends State<viewPage> {
  final user = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Crud With Firebase',
          style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Made With'),
                  Container(
                    // color: Colors.yellow,
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/love.json',
                      ),
                    ),
                  ),
                  Text('By Alif Zulfanur')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:absensi/page/absen.dart';
import 'package:absensi/login.dart';
import 'package:absensi/page/settings.dart';
import 'package:absensi/page/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _currentIndex = 0;

  List<Widget> screen = [
    const viewPage(),
    const absenPage(),
    const settingsPage(),
  ];

  void _changeItem(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingNavbar(
          currentIndex: _currentIndex,
          onTap: _changeItem,
          items: [
            FloatingNavbarItem(icon: Feather.home),
            FloatingNavbarItem(icon: Ionicons.finger_print),
            FloatingNavbarItem(icon: Feather.settings),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../main.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ANJAYYY'),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:absensi/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../main.dart';
import 'package:flutter/material.dart';

class absenPage extends StatefulWidget {
  const absenPage({Key? key}) : super(key: key);

  @override
  State<absenPage> createState() => _absenPageState();
}

class _absenPageState extends State<absenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('absen'),
      ),
    );
  }
}

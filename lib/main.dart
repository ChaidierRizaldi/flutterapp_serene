// @dart=2.7
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterapp_cozy/Pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

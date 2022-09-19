import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterproject/app_screens/education_menu.dart';
import 'package:flutterproject/app_screens/lunch_screen.dart';
import 'package:flutterproject/app_screens/bottom_navigation.dart';
import 'package:flutterproject/app_screens/profile_screen.dart';
import 'package:flutterproject/app_screens/hide_show_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ProfileApp(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/app/landing.page.dart';
import 'package:test_app/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(primaryColor: Colors.indigo),
        home: LandingPage(
          auth: Auth(),
        ),);
  }
}

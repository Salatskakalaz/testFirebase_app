import 'package:flutter/material.dart';
import 'package:test_app/app/sign_in/sign_in_page.dart';

class LandgingPage extends StatefulWidget {
  @override
  _LandgingPageState createState() => _LandgingPageState();
}

class _LandgingPageState extends State<LandgingPage> {
  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}

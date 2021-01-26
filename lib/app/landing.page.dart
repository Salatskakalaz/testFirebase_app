import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/app/sign_in/sign_in_page.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  FirebaseUser _user;

  @override
  void initState() async {
    super.initState();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    _updateUser(user);
  }

  void _updateUser(FirebaseUser user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: (user) => _updateUser(user)
      );
    }
    return HomePage(
      onSignOut: () => _updateUser(null),
    );
  }
}

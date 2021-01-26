import 'package:flutter/material.dart';
import 'package:test_app/app/sign_in/social_sign_in_button.dart';
import 'sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {

  Future <void> _signInInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      print('${authResult.user.uid}');
    }catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
              assetName: 'images/google-logo.png',
              color: Colors.white,
              text: 'Sign in with Google',
              textColor: Colors.black,
              onPressed: () {}),
          SizedBox(height: 8),
          SocialSignInButton(
              assetName: 'images/facebook-logo.png',
              color: Color(0xff334d92),
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              onPressed: () {}),
          SizedBox(height: 8),
          SignInButton(
              color: Colors.teal[700],
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              onPressed: () {}),
          SizedBox(height: 8),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          SignInButton(
              color: Colors.lime[300],
              text: 'Go anonymous',
              textColor: Colors.black,
              onPressed: _signInInAnonymously,
              ),
        ],
      ),
    );
  }
}

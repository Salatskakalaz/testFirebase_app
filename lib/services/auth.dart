import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User {
  User({@required this.uid});

  final String uid;
}

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  User __userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return __userFromFirebase(user);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return __userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

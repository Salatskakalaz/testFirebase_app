import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User {
  User({@required this.uid});

  final String uid;
}

abstract class AuthBase {
  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User __userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @required
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return __userFromFirebase(user);
  }

  @required
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return __userFromFirebase(authResult.user);
  }

  @required
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

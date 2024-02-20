import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin EmailAuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> signUpWithEmail(
    BuildContext context, {
    required String user,
    required String pass,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: user,
        password: pass,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text("Weak Password"),
        ));
      } else if (e.code == 'email-already-in-use') {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text("Email Already Exists"),
        ));
      }

      return null;
    }
  }

  Future<UserCredential?> loginWithEmail(
    BuildContext context, {
    required String user,
    required String pass,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: user,
        password: pass,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text("User Not Found"),
        ));
      } else if (e.code == "wrong-password") {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text("Wrong Password"),
        ));
      }
    }

    return null;
  }
}

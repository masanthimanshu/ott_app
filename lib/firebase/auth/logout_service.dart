import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin LogoutService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout(BuildContext context, {required String route}) {
    _auth.signOut().then((e) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    });
  }
}

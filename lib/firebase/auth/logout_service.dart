import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutService {
  LogoutService({required this.context});

  final BuildContext context;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout({required String route}) {
    _auth.signOut().then((e) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    });
  }
}

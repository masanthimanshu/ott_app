import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin LogoutService {
  void logout(BuildContext context, {required String route}) {
    FirebaseAuth.instance.signOut().then((e) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    });
  }
}

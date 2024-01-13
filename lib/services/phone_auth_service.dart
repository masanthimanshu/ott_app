import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthService {
  PhoneAuthService({required this.context});

  final BuildContext context;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> sendOtp(String phone) async {
    final Completer<String> completer = Completer<String>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (String verificationId, int? resendToken) async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Sent")),
          );
          completer.complete(verificationId);
        },
        verificationFailed: (e) => throw Exception(e.message),
        codeAutoRetrievalTimeout: (String verificationId) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Timed Out")),
          );
        },
      );

      return completer.future;
    } on FirebaseAuthException {
      debugPrint("Error Sending OTP");
      return null;
    }
  }

  Future<UserCredential?> verifyOtp({
    required String otp,
    required String verId,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: otp,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException {
      debugPrint("Error Verifying OTP");
      return null;
    }
  }
}

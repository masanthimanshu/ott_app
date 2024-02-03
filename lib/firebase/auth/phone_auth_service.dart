import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin PhoneAuthService {
  final _auth = FirebaseAuth.instance;

  Future<String?> sendOtp(BuildContext context, {required String phone}) async {
    final Completer<String> completer = Completer<String>();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (e) {},
        codeSent: (String verificationId, int? resendToken) async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Sent")),
          );
          completer.complete(verificationId);
        },
        verificationFailed: (FirebaseAuthException e) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error Sending OTP'),
              content: Text('${e.message}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );

          throw Exception(e.message);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Timed Out")),
          );
        },
      );

      return completer.future;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error Sending OTP: $e");
      return null;
    }
  }

  Future<bool> verifyOtp({
    required String otp,
    required String verId,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: otp,
    );

    final res = await _auth.signInWithCredential(credential);
    return res.user != null;
  }
}

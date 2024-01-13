import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ott_app/model/phone_auth_model.dart';

final _data = PhoneAuthModel();

final phoneAuthServiceProvider =
    StateNotifierProvider<PhoneAuthService, PhoneAuthModel>(
  (ref) => PhoneAuthService(),
);

class PhoneAuthService extends StateNotifier<PhoneAuthModel> {
  PhoneAuthService() : super(_data);

  String _verId = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendOtp({required String phone}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (String verificationId, int? resendToken) async {
          Fluttertoast.showToast(msg: "OTP Sent");
          _verId = verificationId;
        },
        verificationFailed: (e) => throw Exception(e.message),
        codeAutoRetrievalTimeout: (String verificationId) {
          Fluttertoast.showToast(msg: "OTP Timed Out");
        },
      );
    } on FirebaseAuthException {
      Fluttertoast.showToast(msg: "Error Sending OTP");
      return null;
    }
  }

  void verifyOtp({required String otp}) {}
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin SocialAuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final res = await _auth.signInWithCredential(credential);

    return res;
  }

  Future<UserCredential> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    final credential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    final res = await _auth.signInWithCredential(credential);

    return res;
  }
}

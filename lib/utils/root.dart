import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/view/get_started/get_started_screen.dart';
import 'package:ott_app/view/navigation/navigation_screen.dart';

class CustomRoot extends StatelessWidget {
  const CustomRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) return const NavigationScreen();
        return const GetStartedScreen();
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/view/get_started/get_started_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((e) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const GetStartedScreen(),
                ),
              );
            });
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}

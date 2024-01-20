import 'package:flutter/material.dart';
import 'package:ott_app/firebase_services/firebase_auth/logout_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          LogoutService(context: context).logout(
            route: "/get-started",
          );
        },
        child: const Text("Logout"),
      ),
    );
  }
}

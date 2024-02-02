import 'package:flutter/material.dart';
import 'package:ott_app/firebase/auth/logout_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with LogoutService {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => logout(context, route: "/get-started"),
        child: const Text("Logout"),
      ),
    );
  }
}

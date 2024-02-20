import 'package:flutter/material.dart';
import 'package:ott_app/components/profile/arrow_button.dart';
import 'package:ott_app/firebase/auth/logout_service.dart';
import 'package:ott_app/styles/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with LogoutService {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Himanshu Masant",
                    style: CustomTextStyle.mediumText.style,
                  ),
                  Text(
                    "Plan Type - Free",
                    style: CustomTextStyle.lightText.style,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 75),
        Text("Account Details", style: CustomTextStyle.lightText.style),
        const SizedBox(height: 30),
        const ArrowButton(text: "my purchases"),
        const SizedBox(height: 15),
        Divider(color: Colors.white.withOpacity(0.25)),
        const SizedBox(height: 15),
        const ArrowButton(text: "login history"),
        const SizedBox(height: 50),
        Text("About Us", style: CustomTextStyle.lightText.style),
        const SizedBox(height: 30),
        const ArrowButton(text: "terms and conditions"),
        const SizedBox(height: 15),
        Divider(color: Colors.white.withOpacity(0.25)),
        const SizedBox(height: 15),
        const ArrowButton(text: "privacy policy"),
        const SizedBox(height: 15),
        Divider(color: Colors.white.withOpacity(0.25)),
        const SizedBox(height: 15),
        const ArrowButton(text: "help & faq"),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () => logout(context, route: "/get-started"),
          child: const Text("Logout"),
        ),
      ],
    );
  }
}

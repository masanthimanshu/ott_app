import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 30),
            Text("Notifications", style: CustomTextStyle.heading.style),
            const SizedBox(height: 15),
            Text(
              "We'll let you know when we've got something new for you.",
              style: CustomTextStyle.lightText.style,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

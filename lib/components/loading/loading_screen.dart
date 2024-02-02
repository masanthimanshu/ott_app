import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/login_bg.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  "loading...",
                  style: CustomTextStyle.bodyText.style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

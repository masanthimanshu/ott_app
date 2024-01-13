import 'package:flutter/material.dart';
import 'package:ott_app/styles/btn_style.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/auth/phone_number_screen.dart';
import 'package:ott_app/view/navigation/navigation_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/login_bg.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                Text(
                  "OTT Platform",
                  style: CustomTextStyle.heading.style,
                ),
                const SizedBox(height: 20),
                Text(
                  "Watch unlimited movies, series & TV shows anywhere, anytime",
                  style: CustomTextStyle.subHeading.style,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PhoneNumberScreen(),
                        ),
                      );
                    },
                    child: const Text("Login & Subscribe"),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NavigationScreen(),
                        ),
                      );
                    },
                    style: CustomButtonStyle.lightBtn.style,
                    child: const Text("Try as Guest!"),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

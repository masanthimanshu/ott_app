import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
    this.formKey,
    required this.items,
    required this.heading,
    required this.nextBtn,
    required this.subHeading,
  });

  final String heading;
  final String subHeading;
  final List<Widget> items;
  final VoidCallback nextBtn;
  final GlobalKey<FormState>? formKey;

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
                colors: [Colors.black.withOpacity(0.5), Colors.black],
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading, style: CustomTextStyle.heading.style),
                  const SizedBox(height: 5),
                  Text(subHeading, style: CustomTextStyle.subHeading.style),
                  const SizedBox(height: 50),
                  ...items,
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextBtn,
                      child: const Text("Next"),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

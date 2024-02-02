import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";

  _handleSubmit() {}

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
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.5), Colors.black],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello there 👋",
                    style: CustomTextStyle.heading.style,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Enter your name and email to get started",
                    style: CustomTextStyle.subHeading.style,
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    onChanged: (text) => _name = text,
                    style: CustomTextStyle.bodyText.style,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: CustomTextStyle.bodyText.style,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name field is empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (text) => _email = text,
                    style: CustomTextStyle.bodyText.style,
                    decoration: InputDecoration(
                      hintText: "Email (optional)",
                      hintStyle: CustomTextStyle.bodyText.style,
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _handleSubmit();
                        }
                      },
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

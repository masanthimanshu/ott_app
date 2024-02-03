import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/firebase/database/add_data_service.dart';
import 'package:ott_app/styles/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with AddDataService {
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";

  _handleSubmit() {
    final Map<String, dynamic> data = {
      "name": _name,
      "id": user.uid,
      "email": _email,
      "paymentType": "Free",
      "phone": user.phoneNumber!,
    };

    addDocument(collection: "users", data: data).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    });
  }

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
              key: _formKey,
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

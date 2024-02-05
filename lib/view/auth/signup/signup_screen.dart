import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';
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
    if (_formKey.currentState!.validate()) {
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
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      formKey: _formKey,
      nextBtn: _handleSubmit,
      heading: "Hello there 👋",
      subHeading: "Enter your name and email to get started",
      items: [
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
      ],
    );
  }
}

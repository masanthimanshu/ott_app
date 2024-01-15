import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/auth/phone_number_screen.dart';

class NameAndEmailScreen extends StatefulWidget {
  const NameAndEmailScreen({super.key});

  @override
  State<NameAndEmailScreen> createState() => _NameAndEmailScreenState();
}

class _NameAndEmailScreenState extends State<NameAndEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hiveBox = Hive.box("myBox");

  String _name = "";
  String _email = "";

  _handleSubmit() {
    _hiveBox.put("name", _name);
    _hiveBox.put("email", _email);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const PhoneNumberScreen(),
      ),
    );
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
          Form(
            key: _formKey,
            child: Container(
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

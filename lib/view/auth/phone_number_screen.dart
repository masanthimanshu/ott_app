import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ott_app/firebase/auth/phone_auth_service.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/auth/otp_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final RegExp _numberPattern = RegExp(r'^\d{10}$');
  final _hiveBox = Hive.box("myBox");

  String _countryCode = "+91";
  String _phone = "";

  void _handleSubmit() {
    if (_numberPattern.hasMatch(_phone)) {
      final text = "$_countryCode $_phone";

      PhoneAuthService(context: context).sendOtp(text).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => OTPScreen(verId: value!, phone: text),
          ),
        );
      });
    } else if (_phone.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter Phone Number")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Phone Number")),
      );
    }
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
                  "Welcome,",
                  style: CustomTextStyle.heading.style,
                ),
                const SizedBox(height: 10),
                Text(
                  "Hello ${_hiveBox.get("name").toLowerCase()}, enter your phone number to sign in -",
                  style: CustomTextStyle.subHeading.style,
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple.shade200.withOpacity(0.25),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (code) {
                          _countryCode = code.dialCode!;
                        },
                        favorite: const ["IN"],
                        initialSelection: "IN",
                        textStyle: CustomTextStyle.bodyText.style,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (text) => _phone = text,
                          style: CustomTextStyle.bodyText.style,
                          decoration: InputDecoration(
                            hintText: "Phone",
                            border: InputBorder.none,
                            hintStyle: CustomTextStyle.bodyText.style,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    child: const Text("Next"),
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

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';
import 'package:ott_app/firebase/auth/phone_auth_service.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/auth/login/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with PhoneAuthService {
  final RegExp _numberPattern = RegExp(r'^\d{10}$');

  String _countryCode = "+91";
  String _phone = "";

  void _handleSubmit() {
    if (_numberPattern.hasMatch(_phone)) {
      final text = "$_countryCode $_phone";

      sendOtp(context, phone: text).then((value) {
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
    return AuthWrapper(
      nextBtn: _handleSubmit,
      heading: "Welcome User,",
      subHeading: "Enter your phone number to get started -",
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple.shade200.withOpacity(0.25),
          ),
          child: Row(
            children: [
              CountryCodePicker(
                favorite: const ["IN"],
                initialSelection: "IN",
                textStyle: CustomTextStyle.bodyText.style,
                onChanged: (code) => _countryCode = code.dialCode!,
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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ott_app/firebase/auth/phone_auth_service.dart';
import 'package:ott_app/styles/pin_style.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.phone,
    required this.verId,
  });

  final String phone;
  final String verId;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with PhoneAuthService {
  String _otp = "";

  _handleSubmit() {
    verifyOtp(otp: _otp, verId: widget.verId).then((value) {
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
                  "Verify Phone Number",
                  style: CustomTextStyle.heading.style,
                ),
                const SizedBox(height: 5),
                Text(
                  "Enter OTP sent to ${widget.phone}",
                  style: CustomTextStyle.subHeading.style,
                ),
                const SizedBox(height: 50),
                PinCodeTextField(
                  length: 6,
                  autoFocus: true,
                  pinTheme: pinStyle,
                  appContext: context,
                  onChanged: (text) => _otp = text,
                  keyboardType: TextInputType.number,
                  textStyle: CustomTextStyle.bodyText.style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Resend OTP"),
                    ),
                  ],
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

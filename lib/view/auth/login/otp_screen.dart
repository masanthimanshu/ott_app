import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';
import 'package:ott_app/controller/auth/auth_controller.dart';
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

  _handleSubmit() async {
    final data = await verifyOtp(otp: _otp, verId: widget.verId);
    final isSignUp = await AuthController().isSignUp();

    if (!mounted) return;

    if (data) {
      if (isSignUp) {
        Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error Verifying OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      nextBtn: _handleSubmit,
      items: [
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
      ],
    );
  }
}

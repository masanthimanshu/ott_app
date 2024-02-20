import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';
import 'package:ott_app/controller/auth/auth_controller.dart';
import 'package:ott_app/firebase/auth/phone_auth_service.dart';
import 'package:ott_app/styles/package_styles.dart';
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
  final AuthController _authController = AuthController();

  String _otp = "";

  _handleSubmit() async {
    final data = await verifyOtp(otp: _otp, verId: widget.verId);
    final userType = await _authController.checkUser(data.user!.uid);

    if (!mounted) return;

    if (data.user != null) {
      if (userType == "login") {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false);
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
      heading: "Verify Phone Number",
      subHeading: "Enter OTP sent to ${widget.phone}",
      items: [
        PinCodeTextField(
          length: 6,
          autoFocus: true,
          appContext: context,
          pinTheme: otpFieldStyle,
          onChanged: (text) => _otp = text,
          keyboardType: TextInputType.number,
          textStyle: CustomTextStyle.bodyText.style,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => sendOtp(context, phone: widget.phone),
              child: const Text("Resend OTP"),
            ),
          ],
        ),
      ],
    );
  }
}

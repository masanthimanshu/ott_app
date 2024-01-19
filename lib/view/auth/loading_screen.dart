import 'package:flutter/material.dart';
import 'package:ott_app/firebase_services/firebase_auth/phone_auth_service.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/auth/otp_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.phone});

  final String phone;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _handleLogin() async {
    final res = await PhoneAuthService(context: context).sendOtp(
      widget.phone,
    );

    if (!mounted) return;

    if (res != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OTPScreen(
            verId: res,
            phone: widget.phone,
          ),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    _handleLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/login_bg.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  "waiting for otp...",
                  style: CustomTextStyle.bodyText.style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

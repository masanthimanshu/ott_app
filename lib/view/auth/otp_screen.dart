import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ott_app/firebase_services/cloud_firestore/add_data_service.dart';
import 'package:ott_app/firebase_services/firebase_auth/phone_auth_service.dart';
import 'package:ott_app/styles/pin_style.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/navigation/navigation_screen.dart';
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

class _OTPScreenState extends State<OTPScreen> with AddDataService {
  final _hiveBox = Hive.box("myBox");

  String _otp = "";

  _addData({required String uid, required String phone}) {
    final data = {
      "id": uid,
      "phone": phone,
      "name": _hiveBox.get("name"),
      "email": _hiveBox.get("email"),
      "time": FieldValue.serverTimestamp(),
    };

    createDocument(
      data: data,
      document: uid,
      collection: "users",
    );
  }

  _handleSubmit() async {
    final res = await PhoneAuthService(context: context).verifyOtp(
      otp: _otp,
      verId: widget.verId,
    );

    _addData(uid: res.user!.uid, phone: res.user!.phoneNumber!);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const NavigationScreen(),
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

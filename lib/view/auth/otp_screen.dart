import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ott_app/services/auth_service.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/navigation/navigation_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.phone});

  final String phone;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _hiveBox = Hive.box("myBox");
  final _db = FirebaseFirestore.instance;

  String _otp = "";
  String _verId = "";

  _addData({required String uid, required String phone}) {
    final data = {
      "id": uid,
      "phone": phone,
      "name": _hiveBox.get("name"),
      "email": _hiveBox.get("email"),
      "timestamp": FieldValue.serverTimestamp(),
    };

    _db.collection("users").doc(uid).set(data, SetOptions(merge: true));
  }

  _handleSubmit() {
    PhoneAuthService(context: context)
        .verifyOtp(otp: _otp, verId: _verId)
        .then((value) {
      if (value != null) {
        _addData(
          uid: value.user!.uid,
          phone: value.user!.phoneNumber!,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const NavigationScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error Logging In")),
        );
      }
    });
  }

  @override
  void initState() {
    PhoneAuthService(context: context)
        .sendOtp(widget.phone)
        .then((text) => _verId = text!);

    super.initState();
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
                  appContext: context,
                  onChanged: (text) => _otp = text,
                  keyboardType: TextInputType.number,
                  textStyle: CustomTextStyle.bodyText.style,
                  pinTheme: PinTheme(
                    selectedColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    shape: PinCodeFieldShape.box,
                    activeColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(5),
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

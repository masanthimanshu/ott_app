import 'package:flutter/material.dart';
import 'package:ott_app/utils/theme.dart';
import 'package:ott_app/view/get_started/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const GetStartedScreen(),
    );
  }
}

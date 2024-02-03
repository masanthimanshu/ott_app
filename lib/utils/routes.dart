import 'package:flutter/material.dart';
import 'package:ott_app/utils/root.dart';

import '/view/auth/login/login_screen.dart';
import '/view/auth/signup/signup_screen.dart';
import '/view/get_started/get_started_screen.dart';
import '/view/navigation/navigation_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const CustomRoot(),
  "/login": (e) => const LoginScreen(),
  "/signup": (e) => const SignUpScreen(),
  "/home": (e) => const NavigationScreen(),
  "/get-started": (e) => const GetStartedScreen(),
};

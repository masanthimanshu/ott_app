import 'package:flutter/material.dart';
import 'package:ott_app/utils/root.dart';

import '/view/auth/repository/auth_repository.dart';
import '/view/get_started/get_started_screen.dart';
import '/view/navigation/navigation_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const CustomRoot(),
  "/auth": (e) => const AuthRepository(),
  "/home": (e) => const NavigationScreen(),
  "/get-started": (e) => const GetStartedScreen(),
};

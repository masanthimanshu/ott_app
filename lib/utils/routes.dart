import 'package:flutter/material.dart';
import 'package:ott_app/utils/root.dart';

import '/view/auth/name_email_screen.dart';
import '/view/get_started/get_started_screen.dart';
import '/view/navigation/navigation_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/": (e) => const CustomRootWidget(),
  "/home": (e) => const NavigationScreen(),
  "/auth": (e) => const NameAndEmailScreen(),
  "/get-started": (e) => const GetStartedScreen(),
};

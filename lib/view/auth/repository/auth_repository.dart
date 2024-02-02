import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_app/components/loading/loading_screen.dart';
import 'package:ott_app/controller/auth/auth_controller.dart';
import 'package:ott_app/view/auth/login/login_screen.dart';
import 'package:ott_app/view/auth/signup/signup_screen.dart';

class AuthRepository extends ConsumerWidget {
  const AuthRepository({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(authStateNotifier);

    switch (res) {
      case "login":
        return const LoginScreen();

      case "signup":
        return const SignupScreen();

      default:
        return const LoadingScreen();
    }
  }
}

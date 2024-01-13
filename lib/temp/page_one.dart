import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_app/services/phone_auth_service.dart';

class PageOne extends ConsumerWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(phoneAuthServiceProvider);

    return const Scaffold();
  }
}

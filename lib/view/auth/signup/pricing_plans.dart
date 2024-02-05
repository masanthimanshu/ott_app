import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';

class PricingPlans extends StatelessWidget {
  const PricingPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      nextBtn: () {},
      heading: "Pricing Plans",
      subHeading: "Select any of the plan below",
      items: const [],
    );
  }
}

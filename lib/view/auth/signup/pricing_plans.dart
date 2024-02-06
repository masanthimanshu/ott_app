import 'package:flutter/material.dart';
import 'package:ott_app/components/auth/auth_wrapper.dart';
import 'package:ott_app/styles/package_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PricingPlans extends StatefulWidget {
  const PricingPlans({super.key});

  @override
  State<PricingPlans> createState() => _PricingPlansState();
}

class _PricingPlansState extends State<PricingPlans> {
  final PageController _pageController = PageController();

  void _handleSubmit() {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      nextBtn: _handleSubmit,
      heading: "Pricing Plans",
      subHeading: "Choose the best plan for you -",
      items: [
        SizedBox(
          height: 400,
          child: PageView.builder(
              itemCount: 3,
              controller: _pageController,
              itemBuilder: (e, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
        ),
        const SizedBox(height: 20),
        Center(
          child: SmoothPageIndicator(
            count: 3,
            effect: dotIndicatorStyle,
            controller: _pageController,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Explore Screen",
        style: CustomTextStyle.heading.style,
      ),
    );
  }
}

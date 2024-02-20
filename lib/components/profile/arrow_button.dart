import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: CustomTextStyle.bodyText.style),
        const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
      ],
    );
  }
}

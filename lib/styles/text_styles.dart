import 'package:flutter/material.dart';

enum CustomTextStyle { heading, bodyText, mediumText, subHeading, lightText }

extension CustomTextStyleExtension on CustomTextStyle {
  TextStyle get style {
    switch (this) {
      case CustomTextStyle.heading:
        return const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
      case CustomTextStyle.mediumText:
        return const TextStyle(fontSize: 23, color: Colors.white);
      case CustomTextStyle.subHeading:
        return const TextStyle(fontSize: 18, color: Colors.white);
      case CustomTextStyle.lightText:
        return const TextStyle(fontSize: 18, color: Colors.grey);
      case CustomTextStyle.bodyText:
        return const TextStyle(color: Colors.white);
    }
  }
}

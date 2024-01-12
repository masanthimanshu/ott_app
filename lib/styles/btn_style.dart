import 'package:flutter/material.dart';

enum CustomButtonStyle {
  lightBtn,
}

extension CustomButtonStyleExtension on CustomButtonStyle {
  ButtonStyle get style {
    switch (this) {
      case CustomButtonStyle.lightBtn:
        return ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.deepPurple.shade300.withOpacity(0.25),
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        );
    }
  }
}

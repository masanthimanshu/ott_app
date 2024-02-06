import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final otpFieldStyle = PinTheme(
  selectedColor: Colors.grey,
  inactiveColor: Colors.grey,
  shape: PinCodeFieldShape.box,
  activeColor: Colors.deepPurple,
  borderRadius: BorderRadius.circular(5),
);

const dotIndicatorStyle = ExpandingDotsEffect(
  spacing: 4,
  dotWidth: 8,
  dotHeight: 8,
);

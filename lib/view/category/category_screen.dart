import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Category Screen",
        style: CustomTextStyle.heading.style,
      ),
    );
  }
}

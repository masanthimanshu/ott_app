import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Search Screen",
        style: CustomTextStyle.heading.style,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Favourites Screen",
        style: CustomTextStyle.heading.style,
      ),
    );
  }
}

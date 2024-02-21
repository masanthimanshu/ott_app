import 'package:flutter/material.dart';
import 'package:ott_app/components/explore/explore_movie_grid.dart';
import 'package:ott_app/styles/text_styles.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        TextField(
          style: CustomTextStyle.bodyText.style,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: CustomTextStyle.bodyText.style,
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        const SizedBox(height: 50),
        const ExploreMoviesGrid(title: "Movies"),
        const ExploreMoviesGrid(title: "Web Series"),
      ],
    );
  }
}

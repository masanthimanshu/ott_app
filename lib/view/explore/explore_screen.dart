import 'package:flutter/material.dart';
import 'package:ott_app/components/explore/explore_movie_grid.dart';
import 'package:ott_app/styles/text_styles.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
        const SizedBox(height: 30),
        const ExploreMoviesGrid(title: "Bollywood"),
        const ExploreMoviesGrid(title: "Hollywood"),
        const ExploreMoviesGrid(title: "Web Series"),
      ],
    );
  }
}

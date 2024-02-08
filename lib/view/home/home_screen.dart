import 'package:flutter/material.dart';
import 'package:ott_app/components/home/home_hero_scroller.dart';
import 'package:ott_app/components/home/home_movie_list.dart';
import 'package:ott_app/controller/content/content_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContentController().getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            HomeHeroScroller(data: snapshot.data!),
            HomeMovieList(
              title: "Web Series",
              data: snapshot.data!,
            ),
            HomeMovieList(
              title: "Latest Movies",
              data: snapshot.data!,
            ),
            HomeMovieList(
              title: "Trending Shows",
              data: snapshot.data!,
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}

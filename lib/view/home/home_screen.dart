import 'package:flutter/material.dart';
import 'package:ott_app/components/home/home_hero_scroller.dart';
import 'package:ott_app/components/home/home_movie_list.dart';
import 'package:ott_app/controller/get_content_controller.dart';
import 'package:ott_app/model/content_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContentModel>?>(
      future: GetContentController().getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 50),
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

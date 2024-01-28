import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_app/components/home/home_hero_scroller.dart';
import 'package:ott_app/components/home/home_movie_list.dart';
import 'package:ott_app/controller/get_content_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(contentProvider);

    if (!res.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        SizedBox(height: 50),
        HomeHeroScroller(),
        HomeMovieList(title: "Web Series"),
        HomeMovieList(title: "Latest Movies"),
        HomeMovieList(title: "Trending Shows"),
        SizedBox(height: 50),
      ],
    );
  }
}

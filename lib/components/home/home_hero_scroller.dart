import 'package:flutter/material.dart';
import 'package:ott_app/view/player/player_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeroScroller extends StatefulWidget {
  const HomeHeroScroller({super.key});

  @override
  State<HomeHeroScroller> createState() => _HomeHeroScrollerState();
}

class _HomeHeroScrollerState extends State<HomeHeroScroller> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: 5,
            controller: _pageController,
            itemBuilder: (e, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PlayerScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: SmoothPageIndicator(
            count: 5,
            controller: _pageController,
            effect: const ExpandingDotsEffect(
              spacing: 4,
              dotWidth: 8,
              dotHeight: 8,
            ),
          ),
        ),
      ],
    );
  }
}

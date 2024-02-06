import 'package:flutter/material.dart';
import 'package:ott_app/model/content/content_model.dart';
import 'package:ott_app/styles/package_styles.dart';
import 'package:ott_app/view/player/player_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeroScroller extends StatefulWidget {
  const HomeHeroScroller({super.key, required this.data});

  final List<ContentModel> data;

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
            itemCount: widget.data.length,
            controller: _pageController,
            itemBuilder: (e, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlayerScreen(data: widget.data[index]),
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
        SmoothPageIndicator(
          count: widget.data.length,
          effect: dotIndicatorStyle,
          controller: _pageController,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ott_app/styles/text_styles.dart';

class ExploreMoviesGrid extends StatelessWidget {
  const ExploreMoviesGrid({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: CustomTextStyle.subHeading.style),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 15),
            ),
          ],
        ),
        const SizedBox(height: 15),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (e, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ],
    );
  }
}

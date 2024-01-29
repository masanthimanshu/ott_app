import 'package:flutter/material.dart';
import 'package:ott_app/model/content_model.dart';
import 'package:ott_app/styles/text_styles.dart';
import 'package:ott_app/view/player/player_screen.dart';

class HomeMovieList extends StatelessWidget {
  const HomeMovieList({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final List<ContentModel> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomTextStyle.mediumText.style,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 175,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (e, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlayerScreen(data: data[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      data[index].thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

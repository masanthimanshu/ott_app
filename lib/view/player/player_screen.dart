import 'package:flutter/material.dart';
import 'package:ott_app/components/player/video_player.dart';
import 'package:ott_app/styles/text_styles.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const VidePlayer(),
          const SizedBox(height: 50),
          Text(
            "Movie Name",
            style: CustomTextStyle.heading.style,
          ),
          const SizedBox(height: 25),
          Text(
            "Movie Description Goes Here...",
            style: CustomTextStyle.bodyText.style,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: CustomTextStyle.bodyText.style,
          ),
        ],
      ),
    );
  }
}

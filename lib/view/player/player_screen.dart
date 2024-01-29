import 'package:flutter/material.dart';
import 'package:ott_app/components/player/video_player.dart';
import 'package:ott_app/firebase/remote_config/config.dart';
import 'package:ott_app/model/content_model.dart';
import 'package:ott_app/styles/text_styles.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.data});

  final ContentModel data;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> with RemoteConfig {
  String _videoUrl = "";

  void _constructVideoUrl() {
    final String hostname = getStringData("hostname");
    final String fileType = getStringData("fileType");

    _videoUrl = "https://$hostname/${widget.data.videoId}/playlist$fileType";
  }

  @override
  void initState() {
    _constructVideoUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          VideoPlayer(url: _videoUrl),
          const SizedBox(height: 50),
          Text(
            widget.data.title,
            style: CustomTextStyle.heading.style,
          ),
          const SizedBox(height: 25),
          Text(
            widget.data.desc,
            style: CustomTextStyle.bodyText.style,
          ),
        ],
      ),
    );
  }
}

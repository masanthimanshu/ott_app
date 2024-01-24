import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.url});

  final String url;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  _activatePlayer() {
    final uri = Uri.parse(widget.url);

    _videoPlayerController = VideoPlayerController.networkUrl(uri);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      aspectRatio: 16 / 9,
    );
  }

  _deactivatePlayer() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  void initState() {
    _activatePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _deactivatePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(controller: _chewieController),
    );
  }
}

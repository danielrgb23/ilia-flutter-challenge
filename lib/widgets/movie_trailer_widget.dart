import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPlayer extends StatefulWidget {
  final String videoId;

  MovieTrailerPlayer({required this.videoId});

  @override
  _MovieTrailerPlayerState createState() => _MovieTrailerPlayerState();
}

class _MovieTrailerPlayerState extends State<MovieTrailerPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // final videoId = getYouTubeVideoId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
        controller: _controller,
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

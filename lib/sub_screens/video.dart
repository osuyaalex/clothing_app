import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
 final  YoutubePlayerController controller;
  const Video({Key? key, required this.controller}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
            controller: widget.controller,
          showVideoProgressIndicator: false,
          

        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YogaScreenNew extends StatefulWidget {
   String yturl;
   YogaScreenNew({super.key ,required this.yturl });


  @override
  State<YogaScreenNew> createState() => _YogaScreenNewState();
}

class _YogaScreenNewState extends State<YogaScreenNew> {
  YoutubePlayerController? _ytController;
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.yturl);
    _ytController = YoutubePlayerController(
        initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Relax, by doing..',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        toolbarHeight: 120,
      ),
      body: Column(
        children: [
          Center(
            child: YoutubePlayer(
              controller: _ytController!,
            ),
          ),
        ],
      ),


    );
  }
}

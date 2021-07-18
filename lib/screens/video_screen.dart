import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String id;
  final String description;

  VideoScreen({this.id, this.description});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(children: <Widget>[
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print("Video ready!");
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              child: LinkWell(
                "\n" + widget.description + "\n\n",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

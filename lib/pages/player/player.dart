import 'package:clone_flo/pages/player/index.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FloColors.black,
        body: Column(children: const <Widget>[
          PlayerHeader(),
          SongInfo(),
          LyricViewer(),
          LikeButton(),
          ProgressBar(),
          PlayerController()
        ]));
  }
}

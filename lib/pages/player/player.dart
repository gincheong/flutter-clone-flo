import 'package:clone_flo/pages/player/01.player_header/player_header.dart';
import 'package:clone_flo/pages/player/02.song_info/song_info.dart';
import 'package:clone_flo/pages/player/03.lyric_viewer/lyric_viewer.dart';
import 'package:clone_flo/pages/player/04.like_button/like_button.dart';
import 'package:clone_flo/pages/player/05.progress_bar/progress_bar.dart';
import 'package:clone_flo/pages/player/06.player_controller/player_controller.dart';
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

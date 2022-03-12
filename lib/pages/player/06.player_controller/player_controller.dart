import 'package:audioplayers/audioplayers_api.dart';
import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PlayerController extends StatefulWidget {
  const PlayerController({Key? key}) : super(key: key);

  @override
  State<PlayerController> createState() => _PlayerControllerState();
}

class _PlayerControllerState extends State<PlayerController> {
  final Controller c = Get.put(Controller());

  PlayerState playerState = PlayerState.STOPPED;

  @override
  void initState() {
    super.initState();

    c.audioPlayer.value.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        playerState = state;
      });
    });
  }

  void onTapPlayOrPause() async {
    if (playerState == PlayerState.PLAYING) {
      await c.audioPlayer.value.pause();
    } else if (playerState == PlayerState.STOPPED ||
        playerState == PlayerState.COMPLETED) {
      await c.audioPlayer.value.play(c.song.value.file);
    } else {
      await c.audioPlayer.value.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
            child: const FaIcon(
          FontAwesomeIcons.sync,
          color: FloColors.white,
        )),
        const FaIcon(
          FontAwesomeIcons.stepBackward,
          color: FloColors.white,
        ),
        GestureDetector(
          onTap: onTapPlayOrPause,
          child: FaIcon(
            playerState == PlayerState.PLAYING
                ? FontAwesomeIcons.pause
                : FontAwesomeIcons.play,
            color: FloColors.white,
          ),
        ),
        const FaIcon(
          FontAwesomeIcons.stepForward,
          color: FloColors.white,
        ),
        const FaIcon(
          FontAwesomeIcons.random,
          color: FloColors.white,
        ),
      ],
    );
  }
}

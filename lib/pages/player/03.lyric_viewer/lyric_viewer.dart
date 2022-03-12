import 'dart:async';

import 'package:clone_flo/getx/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LyricViewer extends StatefulWidget {
  const LyricViewer({Key? key}) : super(key: key);

  @override
  State<LyricViewer> createState() => _LyricViewerState();
}

class _LyricViewerState extends State<LyricViewer> {
  Controller controller = Get.put(Controller());

  String currentLyric = "";
  String nextLyric = "";

  //
  Timer? timer;
  int currentDuration = 0;

  @override
  void initState() {
    super.initState();

    controller.onPlaying.listen((onPlaying) {
      if (onPlaying) {
        timer = Timer.periodic(
            const Duration(milliseconds: 1000), intervalCallback);
      } else {
        timer!.cancel();
      }
    });
  }

  void intervalCallback(Timer t) async {
    // 1000ms

    int duration = await controller.audioPlayer.value.getCurrentPosition();

    setState(() {
      currentDuration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: <Widget>[
    //     Text(currentLyric),
    //     Text(nextLyric),
    //   ],
    // );
    return Text(currentDuration.toString());
  }
}

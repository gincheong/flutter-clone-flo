import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({Key? key}) : super(key: key);

  static final Controller controller = Get.put(Controller());

  void onTapDebug() async {
    int currentPosition =
        await controller.audioPlayer.value.getCurrentPosition();
    print(currentPosition);
  }

  void onTapPlayOrPause() async {
    controller.onPlaying.value = !controller.onPlaying.value;

    if (controller.onPlaying.value) {
      await controller.audioPlayer.value.resume();
    } else {
      await controller.audioPlayer.value.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
            onTap: onTapDebug,
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
          child: Obx(() => FaIcon(
                controller.onPlaying.value
                    ? FontAwesomeIcons.pause
                    : FontAwesomeIcons.play,
                color: FloColors.white,
              )),
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

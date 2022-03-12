import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/pages/player/05.progress_bar/styles.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  final Controller c = Get.put(Controller());

  // * state
  int totalDurationMsec = 1;
  int currentDurationMsec = 0;

  @override
  void initState() {
    super.initState();

    c.audioPlayer.value.onDurationChanged.listen((Duration d) {
      setState(() {
        totalDurationMsec = d.inMilliseconds;
      });
    });

    c.audioPlayer.value.onAudioPositionChanged.listen((Duration d) {
      setState(() {
        currentDurationMsec = d.inMilliseconds;
      });
    });
  }

  void onChangedSlider(double value) {
    c.audioPlayer.value.seek(Duration(milliseconds: value.toInt()));
  }

  static makeTimestamp(int msec) {
    String minString = (msec / 1000 ~/ 60).toString().padLeft(2, '0');
    String secString = (msec ~/ 1000 % 60).toString().padLeft(2, '0');

    return '$minString:$secString';
  }

  @override
  Widget build(BuildContext context) {
    String currentTimestamp = makeTimestamp(currentDurationMsec);
    String totalTimestamp = makeTimestamp(totalDurationMsec);

    return Container(
        width: scale(1050),
        margin: EdgeInsets.only(bottom: verticalScale(100)),
        child: Column(children: [
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: verticalScale(10),
                  overlayShape: SliderComponentShape.noThumb,
                  thumbColor: FloColors.white,
                  thumbShape: const RoundSliderThumbShape(
                      elevation: 0,
                      pressedElevation: 0,
                      enabledThumbRadius: 0.0)),
              child: SizedBox(
                  height: verticalScale(70),
                  child: Slider(
                      activeColor: FloColors.accent,
                      inactiveColor: FloColors.disable,
                      thumbColor: FloColors.transparent,
                      value: currentDurationMsec.toDouble(),
                      max: totalDurationMsec.toDouble(),
                      onChanged: onChangedSlider))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(currentTimestamp, style: Styles.currentTimestampText),
              Text(totalTimestamp, style: Styles.totalTimestampText)
            ],
          )
        ]));
  }
}

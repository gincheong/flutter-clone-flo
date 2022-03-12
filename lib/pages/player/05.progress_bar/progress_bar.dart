import 'package:clone_flo/getx/controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: verticalScale(100)),
        child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                trackHeight: verticalScale(10),
                thumbColor: FloColors.transparent,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
            child: Slider(
                activeColor: FloColors.accent,
                inactiveColor: FloColors.disable,
                thumbColor: FloColors.transparent,
                value: currentDurationMsec.toDouble(),
                max: totalDurationMsec.toDouble(),
                onChanged: onChangedSlider)));
  }
}

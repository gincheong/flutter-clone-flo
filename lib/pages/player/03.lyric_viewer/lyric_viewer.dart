import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/pages/player/03.lyric_viewer/styles.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:clone_flo/utils/utils.dart';
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

  @override
  void initState() {
    super.initState();

    controller.audioPlayer.value.onAudioPositionChanged.listen((Duration d) {
      // * 재생위치가 변경될 때마다 아래 실행

      setState(() {
        String currentDuration = d.toString().substring(2, 11);

        int currentMsec = getTotalMsecFromTimestamp(currentDuration);
        // * 가사가 있는 밀리초 값들을 가진 리스트에서, 현재 시간 기준으로 어떤 밀리초의 가사를 가져오면 좋을지 인덱스를 가져옴
        int nextLyricIndex = getNextLyricIndex(currentMsec);

        currentLyric = getLyricFromMap(nextLyricIndex - 1);
        nextLyric = getLyricFromMap(nextLyricIndex);
      });
    });
  }

  String getLyricFromMap(int index) {
    if (index < 0 || index >= controller.song.value.lyricTimeList.length) {
      return '';
    }
    int key = controller.song.value.lyricTimeList[index];

    return controller.song.value.lyricMap[key.toString()] ?? '';
  }

  // * 현재 시간값에 대해서, 다음에 표시할 가사의 index를 반환함
  int getNextLyricIndex(int value) {
    final list = controller.song.value.lyricTimeList;

    int result = 0;
    for (var i = 0; i < list.length; i++) {
      final each = list[i];
      result = i;
      if (value < each) {
        break;
      }
    }

    // * 0이 반환되는 경우: 첫 가사가 시작하기 이전임 (currentLyric이 빈 문자열이 되어야 함)
    // * list.length가 반환되는 경우: 맨 마지막 가사가 표시되면 됨 (nextLyric이 빈 문자열이 되어야 함)
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: verticalScale(10)),
          child: Text(currentLyric, style: currentLyricStyle),
        ),
        Text(nextLyric, style: nextLyricStyle)
      ],
    );
  }
}

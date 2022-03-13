import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/pages/lyric/02.lyrics/styles.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({Key? key}) : super(key: key);

  static Controller c = Get.put(Controller());

  void onTapLyric(String milliseconds) {
    c.audioPlayer.value.seek(Duration(milliseconds: int.parse(milliseconds)));
  }

  @override
  Widget build(BuildContext context) {
    // * getNextLyrics 참고해서, 현재 재생 중인 6항목을 highlight하도록 처리

    return Expanded(
        child: Container(
            margin: EdgeInsets.only(left: scale(30), right: scale(30)),
            child: ListView.builder(
                itemCount: c.song.value.lyricTimeList.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  MapEntry each =
                      c.song.value.lyricMap.entries.elementAt(index);

                  return Container(
                      margin: EdgeInsets.only(bottom: verticalScale(15)),
                      child: GestureDetector(
                        onTap: () => onTapLyric(each.key),
                        child: Obx(() => Text(each.value,
                            style: index == c.currentLyricIndex.value
                                ? Styles.activeLyric
                                : Styles.inactiveLyric)),
                      ));
                })));
  }
}

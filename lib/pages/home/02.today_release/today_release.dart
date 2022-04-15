import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:clone_flo/widgets/index.dart';
import 'package:flutter/material.dart';

class TodayRelease extends StatefulWidget {
  const TodayRelease({Key? key}) : super(key: key);

  @override
  State<TodayRelease> createState() => _TodayReleaseState();
}

class _TodayReleaseState extends State<TodayRelease> {
  int selectedIndex = 0;

  final List<Color> colors = [
    FloColors.accent,
    FloColors.blue,
    FloColors.brown,
    FloColors.green,
    FloColors.gray,
    FloColors.white
  ];

  final List<String> titles = [
    'Above the Clouds',
    'falling asleep together while it rains',
    'pause',
    'Palace in The Sky',
    'Moonglow',
    'Returnal',
  ];

  final List<String> buttonTexts = ['종합', '국내', '해외'];

  void onPressedButton(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTitle(
          title: '오늘 발매 음악',
          children: Iterable<int>.generate(buttonTexts.length).map((idx) {
            return FloTextButton(
              text: buttonTexts[idx],
              selected: selectedIndex == idx,
              onPressed: () => onPressedButton(idx),
            );
          }).toList()),
      SizedBox(
          width: fullWidth,
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  child: AlbumCoverIcon(
                      coverColor: colors[index], title: titles[index]));
            },
          )),
    ]);
  }
}

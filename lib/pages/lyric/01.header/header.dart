import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/pages/lyric/01.header/styles.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  void onTapClose() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());

    // * get status bar height (on mobile)
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        margin: EdgeInsets.only(
          top: statusBarHeight + verticalScale(30),
          left: scale(30),
          right: scale(50),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: verticalScale(30)),
              child: Text(c.song.value.title, style: Styles.title),
            ),
            Text(c.song.value.singer, style: Styles.singer)
          ]),
          GestureDetector(
              onTap: onTapClose,
              child: const FaIcon(
                FontAwesomeIcons.times,
                color: FloColors.white,
              ))
        ]));
  }
}

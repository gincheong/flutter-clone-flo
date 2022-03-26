import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/widgets/FloIcon/flo_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwiperContentHeader extends StatelessWidget {
  const SwiperContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 30, right: 5),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: FloColors.white, width: 1)),
                child: const Text('이용권',
                    style: TextStyle(fontSize: 14, color: FloColors.white))),
            Expanded(flex: 1, child: Container()),
            const FloIcon(FontAwesomeIcons.microphone),
            const FloIcon(FontAwesomeIcons.bell),
            const FloIcon(FontAwesomeIcons.cog),
          ],
        ));
  }
}

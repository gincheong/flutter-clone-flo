import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: verticalScale(70), bottom: verticalScale(220)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(FontAwesomeIcons.heart, color: FloColors.white),
          SizedBox(width: scale(90)),
          const FaIcon(FontAwesomeIcons.ban, color: FloColors.white)
        ],
      ),
    );
  }
}

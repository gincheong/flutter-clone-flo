import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({Key? key}) : super(key: key);

  void onPressed() {
    print('onpress Buttons');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: scale(5), right: scale(5)),
        child: Column(children: [
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: onPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.slidersH,
                    color: FloColors.white,
                  )),
              IconButton(
                  onPressed: onPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.audioDescription,
                    color: FloColors.white,
                  )),
              IconButton(
                  onPressed: onPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    color: FloColors.disable,
                    size: 16,
                  )),
              const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: onPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronDown,
                    color: FloColors.white,
                  )),
            ],
          ),
          Row(children: <Widget>[
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: onPressed,
                icon: const FaIcon(FontAwesomeIcons.ellipsisV,
                    color: FloColors.white, size: 16)),
          ])
        ]));
  }
}

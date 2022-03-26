import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/utils/utils.dart';
import 'package:clone_flo/widgets/FloIcon/flo_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwiperContent extends StatelessWidget {
  const SwiperContent(
      {Key? key, required this.title, required this.backgroundColor})
      : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = getStatusBarHeight(context);

    return Container(
        padding: EdgeInsets.only(top: statusBarHeight, left: 30, right: 30),
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // * 퇴근길 머리를 식혀주는 ...
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 28,
                          color: FloColors.white,
                          fontWeight: FontWeight.w600)),
                  const FaIcon(FontAwesomeIcons.solidPlayCircle,
                      color: FloColors.white, size: 40)
                ]),
            const SizedBox(height: 100),
            // * 총 n곡 ...
            const Text('총 43곡 2021.11.05',
                style: TextStyle(fontSize: 13, color: FloColors.white)),
            const SizedBox(height: 10),
            // * Intentions
            Row(children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 43,
                  width: 43,
                  color: FloColors.white),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Intentions (Acoustic)',
                        style: TextStyle(fontSize: 16, color: FloColors.white)),
                    SizedBox(height: 5),
                    Text('Justin Bieber',
                        style: TextStyle(fontSize: 13, color: FloColors.white)),
                  ])
            ]),
            const SizedBox(height: 15),
            // * Smile
            Row(children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 43,
                  width: 43,
                  color: FloColors.accent),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Smile',
                        style: TextStyle(fontSize: 16, color: FloColors.white)),
                    SizedBox(height: 5),
                    Text('Johnny Stimson',
                        style: TextStyle(fontSize: 13, color: FloColors.white)),
                  ])
            ]),
          ],
        ));
  }
}

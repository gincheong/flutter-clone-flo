import 'package:clone_flo/pages/home/01.header_swiper/01.swiper_content/swiper_content.dart';
import 'package:clone_flo/pages/home/01.header_swiper/01.swiper_content/swiper_content_header.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:clone_flo/utils/utils.dart';
import 'package:flutter/material.dart';

class HeaderSwiper extends StatefulWidget {
  const HeaderSwiper({Key? key}) : super(key: key);

  @override
  State<HeaderSwiper> createState() => _HeaderSwiperState();
}

class _HeaderSwiperState extends State<HeaderSwiper> {
  // * state
  double swiperLeft = 0;

  void onPanUpdate(DragUpdateDetails details) {
    final delta = details.delta;
    // final localPosition = details.localPosition;

    setState(() {
      final newLeft = swiperLeft + delta.dx;
      if (newLeft >= 0) {
        swiperLeft = newLeft;
      }
    });
  }

  final List<Color> containerColors = [
    FloColors.blue,
    FloColors.green,
    FloColors.brown
  ];

  final List<String> containerTitles = [
    '퇴근길 머리를\n식혀주는 팝사운드',
    '커피와 함께 부드러운\n팝 발라드',
    '발걸음 가볍게 떠나는\n즐거운 여행'
  ];

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = getStatusBarHeight(context);

    return Stack(children: [
      SizedBox(
          width: fullWidth,
          height: 450,
          child: PageView.builder(
              // ! "맨 왼쪽" 항목에 언젠간 도달하게 되어있음
              controller: PageController(initialPage: 999),
              itemBuilder: (context, index) {
                return SwiperContent(
                  title: containerTitles[index % containerTitles.length],
                  backgroundColor:
                      containerColors[index % containerColors.length],
                );
              })),
      Positioned(
          top: statusBarHeight,
          left: 0,
          right: 0,
          bottom: 380,
          child: const SwiperContentHeader()),
    ]);
  }
}

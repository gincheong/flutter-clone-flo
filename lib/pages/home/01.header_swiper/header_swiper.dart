import 'package:clone_flo/pages/home/01.header_swiper/01.swiper_content/swiper_content.dart';
import 'package:clone_flo/pages/home/01.header_swiper/01.swiper_content/swiper_content_header.dart';
import 'package:clone_flo/pages/home/01.header_swiper/02.swiper_indicator/swiper_indicator.dart';
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
  int pageViewIndex = 0;

  final List<Color> containerColors = [
    FloColors.blue,
    FloColors.green,
    FloColors.brown,
    FloColors.blue,
    FloColors.green,
    FloColors.brown
  ];

  final List<String> containerTitles = [
    '퇴근길 머리를\n식혀주는 팝사운드',
    '커피와 함께 부드러운\n팝 발라드',
    '발걸음 가볍게 떠나는\n즐거운 여행',
    '퇴근길 머리를\n식혀주는 팝사운드',
    '커피와 함께 부드러운\n팝 발라드',
    '발걸음 가볍게 떠나는\n즐거운 여행'
  ];

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = getStatusBarHeight(context);

    void onPageChanged(int index) {
      setState(() {
        pageViewIndex = index;
      });
    }

    return Column(children: [
      Stack(children: [
        SizedBox(
            width: fullWidth,
            height: 450,
            child: PageView.builder(
                // ! "맨 왼쪽" 항목에 언젠간 도달하게 되어있음
                controller: PageController(initialPage: pageViewIndex),
                onPageChanged: onPageChanged,
                itemCount: containerColors.length,
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
      ]),
      SwiperIndicator(index: pageViewIndex, pageCount: containerTitles.length)
    ]);
  }
}

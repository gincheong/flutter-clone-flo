import 'package:clone_flo/pages/home/01.header_swiper/header_swiper.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FloColors.black,
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: const [HeaderSwiper()],
        ));
  }
}

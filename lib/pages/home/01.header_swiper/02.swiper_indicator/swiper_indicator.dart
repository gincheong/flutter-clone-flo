import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';

class SwiperIndicator extends StatelessWidget {
  const SwiperIndicator(
      {Key? key, required this.index, required this.pageCount})
      : super(key: key);

  final int index;
  final int pageCount;

  bool isActive(int index) {
    return this.index % pageCount == index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Iterable<int>.generate(pageCount).map((idx) {
              return Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                width: isActive(idx) ? 10 : 5,
                height: isActive(idx) ? 10 : 5,
                decoration: BoxDecoration(
                    color: isActive(idx) ? FloColors.accent : FloColors.gray,
                    shape: BoxShape.circle),
              );
            }).toList()));
  }
}

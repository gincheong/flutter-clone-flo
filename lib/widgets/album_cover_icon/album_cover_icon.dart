import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';

class AlbumCoverIcon extends StatelessWidget {
  final Color coverColor;
  final String title;

  const AlbumCoverIcon(
      {Key? key, this.coverColor = FloColors.green, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 170,
        width: 170,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: coverColor, borderRadius: BorderRadius.circular(7)),
        ),
      ),
      const SizedBox(width: 0, height: 8),
      SizedBox(
          width: 170,
          height: 30,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(title)))
          ]))
    ]);
  }
}

import 'package:clone_flo/widgets/FloIcon/flo_icon.dart';
import 'package:clone_flo/widgets/list_title/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final List<Widget>? children;

  const ListTitle({Key? key, required this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Row(children: [
          Text(title, style: titleStyle),
          const FloIcon(FontAwesomeIcons.angleRight),
          Expanded(child: Container()),
          ...?children
        ]));
  }
}

import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloIcon extends StatelessWidget {
  const FloIcon(
    this.iconName, {
    Key? key,
  }) : super(key: key);

  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: FaIcon(iconName, color: FloColors.white));
  }
}

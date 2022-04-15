import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';

class FloTextButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function? onPressed;

  const FloTextButton(
      {Key? key, required this.text, this.selected = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPressed!(),
        child: Container(
            padding: const EdgeInsets.only(left: 9, right: 9),
            child: Text(text,
                style: TextStyle(
                    color: selected ? FloColors.accent : FloColors.white,
                    fontSize: 16))));
  }
}

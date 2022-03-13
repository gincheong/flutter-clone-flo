import 'package:clone_flo/pages/lyric/01.header/header.dart';
import 'package:clone_flo/pages/lyric/02.lyrics/lyrics.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:flutter/material.dart';

class LyricPage extends StatefulWidget {
  const LyricPage({Key? key}) : super(key: key);

  @override
  State<LyricPage> createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FloColors.black,
        body: Column(children: const [Header(), Lyrics()]));
  }
}

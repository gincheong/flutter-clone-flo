import 'dart:convert';
import 'dart:io';

import 'package:clone_flo/api/api.dart';
import 'package:clone_flo/getx/controller.dart';
import 'package:clone_flo/interfaces/song.dart';
import 'package:clone_flo/pages/player/02.song_info/styles.dart';
import 'package:clone_flo/styles/colors.dart';
import 'package:clone_flo/styles/scaling.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SongInfo extends StatefulWidget {
  const SongInfo({Key? key}) : super(key: key);

  @override
  State<SongInfo> createState() => _SongInfoState();
}

class _SongInfoState extends State<SongInfo> {
  final Controller c = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    loadSongInfo();
  }

  void loadSongInfo() async {
    const path = '/2020-flo/song.json';
    final url = Uri.https(apiEndPoint, path);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // * 이렇게 하면 json으로 넘어오는 한글이 깨지지 않음
      ISong result =
          ISong.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      c.song.value = result;
      c.audioPlayer.value.setUrl(result.file);
    } else {
      throw HttpException('statusCode: $response.statusCode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 노래 제목
      Container(
          margin: EdgeInsets.only(top: verticalScale(80)),
          child: Obx(
              () => Text(c.song.value.title, style: SongInfoStyles.songTitle))),
      // 아티스트명
      Container(
        margin: EdgeInsets.only(top: verticalScale(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
                Text(c.song.value.singer, style: SongInfoStyles.artistName)),
            Container(
                margin: EdgeInsets.only(left: scale(20)),
                child: const FaIcon(FontAwesomeIcons.chevronRight,
                    color: FloColors.gray, size: 13)),
          ],
        ),
      ),
      // 앨범아트
      Container(
          margin: EdgeInsets.only(top: verticalScale(50)),
          child: Obx(
            () => c.song.value.image.isNotEmpty
                ? Image(
                    image: NetworkImage(c.song.value.image),
                    width: scale(800),
                    height: scale(800),
                  )
                : const SizedBox(),
          ))
    ]);
  }
}

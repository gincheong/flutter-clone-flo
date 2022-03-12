import 'package:clone_flo/utils/utils.dart';

class ISong {
  String singer;
  String album;
  String title;
  int duration;
  String image;
  String file;
  String lyrics;
  Map<String, String> lyricMap;
  List<int> lyricTimeList;

  static const Map<String, String> defaultMap = {};
  static const List<int> defaultLyricTimeList = [];

  ISong(
      {required this.singer,
      required this.album,
      required this.title,
      required this.duration,
      required this.image,
      required this.file,
      required this.lyrics,
      this.lyricMap = defaultMap,
      this.lyricTimeList = defaultLyricTimeList});

  factory ISong.fromJson(Map<String, dynamic> json) {
    final result = parseLyrics(json['lyrics']);

    return ISong(
        singer: json['singer'],
        album: json['album'],
        title: json['title'],
        duration: json['duration'],
        image: json['image'],
        file: json['file'],
        lyrics: json['lyrics'],
        lyricMap: result['map'],
        lyricTimeList: result['list']);
  }

  static Map parseLyrics(String lyrics) {
    List<String> lyricList = lyrics.split('\n');

    Map<String, String> map = {};
    List<int> list = [];

    for (String each in lyricList) {
      String timestamp = each.substring(1, 10);

      int totalMsec = getTotalMsecFromTimestamp(timestamp);
      list.add(totalMsec);

      String lyric = each.substring(11);
      map[totalMsec.toString()] = lyric;
    }

    return {'map': map, 'list': list};
  }
}

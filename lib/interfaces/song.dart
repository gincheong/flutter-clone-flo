class ISong {
  String singer;
  String album;
  String title;
  int duration;
  String image;
  String file;
  String lyrics;
  Map<String, String>? parsedLyricMap;

  ISong(
      {required this.singer,
      required this.album,
      required this.title,
      required this.duration,
      required this.image,
      required this.file,
      required this.lyrics,
      this.parsedLyricMap});

  factory ISong.fromJson(Map<String, dynamic> json) {
    Map<String, String> map = parseLyrics(json['lyrics']);

    return ISong(
      singer: json['singer'],
      album: json['album'],
      title: json['title'],
      duration: json['duration'],
      image: json['image'],
      file: json['file'],
      lyrics: json['lyrics'],
      parsedLyricMap: map,
    );
  }

  static Map<String, String> parseLyrics(String lyrics) {
    List<String> lyricList = lyrics.split('\n');

    Map<String, String> map = {};

    lyricList.forEach((each) {
      String timeStamp = each.substring(1, 10);
      String lyric = each.substring(11);

      map[timeStamp] = lyric;
    });

    return map;
  }
}

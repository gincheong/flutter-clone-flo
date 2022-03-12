import 'package:audioplayers/audioplayers.dart';
import 'package:clone_flo/interfaces/song.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var song = ISong(
          singer: 'singer',
          album: 'album',
          title: 'title',
          duration: 0,
          image: '',
          file: 'file',
          lyrics: 'lyrics')
      .obs;
  // var playtime = 0.obs;
  var onPlaying = false.obs;

  var audioPlayer = AudioPlayer().obs;
}

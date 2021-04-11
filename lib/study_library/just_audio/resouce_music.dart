import 'package:just_audio/just_audio.dart';

class AudioMetadata {
  String album;
  String title;
  String artwork;
  AudioMetadata(
      {required this.album, required this.title, required this.artwork});
}

final playlist = ConcatenatingAudioSource(children: [
  ClippingAudioSource(
    start: Duration(seconds: 0),
    end: Duration(seconds: 360),
    child: AudioSource.uri(Uri.parse(
        "https://webfs.yun.kugou.com/202104111649/5d41897233a1c5e6823a4085239f01da/G220/M07/00/00/HA4DAF8qaWyANAY4ADEy7RR9FTs191.mp3")),
    tag: AudioMetadata(
      album: "Science Friday",
      title: "A Salute To Head-Scratching Science (30 seconds)",
      artwork:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
  ),
]);

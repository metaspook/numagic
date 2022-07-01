import 'package:audioplayers/audioplayers.dart';

class Music {
  Music._();
  factory Music() => Music._();

  final player = AudioPlayer();
  final audioClick = AssetSource("audio/click.wav");
  final audioInvalid = AssetSource("audio/invalid.wav");
  final audioSuccess = AssetSource("audio/success.wav");
}

import 'package:flutter_tts/flutter_tts.dart';

//Flutter tts
FlutterTts flutterTts = FlutterTts();
double volume = 1.0; //volumen
double pitch = .5;
double rate = 1.0;

Future speak(String text) async {
  await flutterTts.setVolume(volume);
  //await flutterTts.setSpeechRate(rate);
  //await flutterTts.setPitch(pitch);
  await flutterTts.speak(text);
}

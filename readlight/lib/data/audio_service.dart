import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AudioService {
  final AudioPlayer backgroundPlayer;
  final AudioPlayer customPlayer;
  String? customAudioPath;
  bool isCustomAudioPlaying;

  AudioService()
      : backgroundPlayer = AudioPlayer(),
        customPlayer = AudioPlayer(),
        isCustomAudioPlaying = false;

  Future<void> initializeBackgroundMusic() async {
    try {
      await backgroundPlayer.setAsset('assets/audio/background_music.mp3');
      await backgroundPlayer.setLoopMode(LoopMode.one);
      await backgroundPlayer.setVolume(0.5);
    } catch (e) {
      print('Error initializing background music: $e');
      rethrow;
    }
  }

  Future<String?> saveAudioFile(String originalPath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final savedFile = await File(originalPath).copy(
          '${directory.path}/custom_audio_${DateTime.now().millisecondsSinceEpoch}.${originalPath.split('.').last}');
      return savedFile.path;
    } catch (e) {
      print('Error saving audio file: $e');
      return null;
    }
  }

  Future<void> playBackgroundMusic() async {
    if (!backgroundPlayer.playing) {
      await backgroundPlayer.play();
    }
  }

  Future<void> pauseBackgroundMusic() async {
    if (backgroundPlayer.playing) {
      await backgroundPlayer.pause();
    }
  }

  Future<void> playCustomAudio() async {
    if (customAudioPath != null && !customPlayer.playing) {
      await customPlayer.play();
      isCustomAudioPlaying = true;
    }
  }

  Future<void> pauseCustomAudio() async {
    if (customPlayer.playing) {
      await customPlayer.pause();
      isCustomAudioPlaying = false;
    }
  }

  Future<void> setCustomAudio(String filePath) async {
    await customPlayer.setFilePath(filePath);
    customAudioPath = filePath;
  }

  void dispose() {
    backgroundPlayer.dispose();
    customPlayer.dispose();
  }
}

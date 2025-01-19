import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_colors.dart';
import '../states/profile_screen_state.dart';
import '../data/audio_service.dart';

class ProfileController {
  final BuildContext context;
  final Function setState;
  final ProfileState state;
  final AudioService audioService;

  ProfileController(this.context, this.setState)
      : state = ProfileState(),
        audioService = AudioService() {
    _initialize();
  }

  Future<void> _initialize() async {
    await audioService.initializeBackgroundMusic();
    if (state.isMusicOn) {
      await audioService.playBackgroundMusic();
    }
  }

  void toggleMusic() {
    setState(() {
      state.isMusicOn = !state.isMusicOn;
    });

    if (state.isMusicOn) {
      audioService.playBackgroundMusic();
      if (audioService.isCustomAudioPlaying) {
        audioService.playCustomAudio();
      }
    } else {
      audioService.pauseBackgroundMusic();
      audioService.pauseCustomAudio();
    }
  }

  Future<void> pickAudioFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null) {
        String originalPath = result.files.single.path!;
        String? savedPath = await audioService.saveAudioFile(originalPath);

        if (savedPath != null) {
          await audioService.setCustomAudio(savedPath);
          if (state.isMusicOn) {
            await audioService.playCustomAudio();
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Audio file uploaded successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading audio file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void saveProfile() {
    final profileData = {
      'aliasName': state.aliasName,
      'quote': state.quote,
      'description': state.descriptionController.text,
      'audioSettings': {
        'isMusicOn': state.isMusicOn,
        'customAudioPath': audioService.customAudioPath,
        'isCustomAudioPlaying': audioService.isCustomAudioPlaying,
      },
    };

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully')),
    );
  }

  void previewProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.brownDissolve,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Preview",
                    style: TextStyle(
                      color: AppColors.lightBrown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPreviewContent(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B8B5A),
                      foregroundColor: const Color(0xFFF5F5DC),
                    ),
                    child: const Text('Close Preview'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPreviewContent() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          const SizedBox(height: 10),
          Text(
            state.aliasName,
            style: const TextStyle(
              color: Color(0xFFF5F5DC),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            state.quote,
            style: const TextStyle(
              color: Color(0xFFF5F5DC),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              state.descriptionController.text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    audioService.dispose();
    state.dispose();
  }
}

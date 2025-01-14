import 'package:flutter/material.dart';
import 'package:readlight/screens/loading_screen.dart';
import 'package:readlight/data/supabase_configuration.dart';
import 'screens/new_story_screen.dart';
import 'theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.onSurfaceVariant,
      ),
      home: const NewStoryScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readlight/data/supabase_configuration.dart';
import 'package:readlight/screens/create_account_screen.dart';
import 'package:readlight/screens/daily_quote_screen.dart';
import 'package:readlight/screens/genre_selection_screen.dart';
import 'package:readlight/screens/homepage_screen.dart';
import 'package:readlight/screens/loading_screen.dart';
import 'package:readlight/screens/login_screen.dart';
import 'package:readlight/screens/no_save_screen.dart';
import 'package:readlight/screens/password_recovery_screen.dart';
import 'package:readlight/screens/role_selection_screen.dart';
import 'package:readlight/screens/video_screen.dart';
import 'theme/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SupabaseConfig.initialize();

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  } catch (e) {
    print('Errore durante l\'inizializzazione: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.onSurfaceVariant,
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => const HomePageScreen(),
        '/login': (context) => const LoginScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/no_save': (context) => const NoSaveScreen(),
        '/video': (context) => const VideoScreen(),
        '/password_recovery': (context) => const RecoveryPasswordScreen(),
        '/role_selection': (context) => const RoleSelectionScreen(),
        '/genre_selection': (context) => const GenreSelectionScreen(userRole: '',),
        '/daily_quote': (context) => const DailyQuoteScreen(),
      },
    );
  }
}

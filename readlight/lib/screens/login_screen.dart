import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'next_screen_login.dart';
import '/components/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Readlight'),
        backgroundColor: AppColors.onSurfaceVariant,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Center(
              child: LoginButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NextScreenLogin()),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: PlaceholderButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NextScreenLogin()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

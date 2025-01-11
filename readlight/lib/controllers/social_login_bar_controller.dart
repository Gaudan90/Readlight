import 'package:flutter/material.dart';
import 'package:readlight/screens/login_screen.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import '../screens/create_account_screen.dart';
import '../screens/homepage_screen.dart';
import '../screens/role_selection_screen.dart';
import '../states/social_login_bar_state.dart';
import '../theme/app_colors.dart';

class SocialLoginBarController {
  final SocialLoginBarState state = SocialLoginBarState();

  Future<void> onGoogleTap(BuildContext context) async {
    try {
      state.startLoading('google');
      // TODO: Inserire la logica di autenticazione Google
      await Future.delayed(const Duration(seconds: 2)); // Fake API
      await _handleAuthSuccess(context);
    } catch (e) {
      state.setError('Errore durante l\'accesso con Google: ${e.toString()}');
    } finally {
      state.stopLoading();
    }
  }

  Future<void> onFacebookTap(BuildContext context) async {
    try {
      state.startLoading('facebook');
      // TODO: Inserire la logica di autenticazione Facebook
      await Future.delayed(const Duration(seconds: 2));
      await _handleAuthSuccess(context);
    } catch (e) {
      state.setError('Errore durante l\'accesso con Facebook: ${e.toString()}');
    } finally {
      state.stopLoading();
    }
  }

  Future<void> onInstagramTap(BuildContext context) async {
    try {
      state.startLoading('instagram');
      // TODO: Inserire la logica di autenticazione Instagram
      await Future.delayed(const Duration(seconds: 2));
      await _handleAuthSuccess(context);
    } catch (e) {
      state.setError('Errore durante l\'accesso con Instagram: ${e.toString()}');
    } finally {
      state.stopLoading();
    }
  }

  Future<void> _handleAuthSuccess(BuildContext context) async {
    Widget? currentScreen = context.widget;
    BuildContext? currentContext = context;

    while (currentContext != null) {
      currentScreen = currentContext.widget;
      if (currentScreen is LoginScreen ||
          currentScreen is CreateAccountScreen ||
          currentScreen is HomePageScreen) {
        break;
      }
      currentContext = currentContext.findAncestorStateOfType<State>()?.context;
    }

    Widget destinationScreen;

    if (currentScreen is CreateAccountScreen) {
      destinationScreen = const RoleSelectionScreen();
    } else if (currentScreen is LoginScreen) {
      destinationScreen = const RoleSelectionScreen();
    } else {
      destinationScreen = const HomePageScreen();
    }

    Navigator.of(context).push(
      TurnPageRoute(
        overleafColor: AppColors.secondaryFixedDim,
        animationTransitionPoint: 0.5,
        transitionDuration: const Duration(milliseconds: 800),
        builder: (context) => destinationScreen,
      ),
    );
  }
}

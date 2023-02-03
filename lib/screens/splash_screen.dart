import 'package:flutter/material.dart';

import '../shared/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const AssetImage(Images.splashlogo),
      backgroundColor: Palette.white,
      nextScreen: OnboardingScreen(),
      duration: 3000,
      splashIconSize: 380,
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../shared/exports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Get.off(() => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset(
          'assets/images/awstorelogo.png',
          height: MediaQuery.of(context).size.height*0.3,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

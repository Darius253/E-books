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
    Timer(const Duration(seconds: 5),
        () => Get.off(() => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Image.asset(
          //   'assets/images/logo_background.png',
          //   filterQuality: FilterQuality.high,
          // ),
          Center(
            child: Image.asset(
              'assets/images/awstorelogo.png',
              height: MediaQuery.of(context).size.height*0.3,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}

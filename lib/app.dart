import 'package:flutter/cupertino.dart';
import 'package:reader_app/onboarding/onboarding.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}

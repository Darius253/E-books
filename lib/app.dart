<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reader App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
=======
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
>>>>>>> master
  }
}

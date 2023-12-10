import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/authenticate/new_user/genre.dart';
import 'package:reader_app/screens/creator_dashboards/creator_home.dart';
import '../shared/exports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    Person? person = boxPersons.get('personDetails');
    FavGenres? favGenres = boxGenres.get('favGenres');
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (person == null || person.userId.isEmpty) {
        Get.off(() => const OnboardingScreen());
      } else if (person.userId.isNotEmpty && favGenres == null ||
          favGenres!.genres.isEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const SelectGenre())));
      } else if (person.accountType == 'subscriber' &&
          favGenres.genres.isNotEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const HomePage())));
      } else if (person.accountType != 'subscriber' &&
          favGenres.genres.isNotEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const CreatorHome())));
      }
    });
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
          height: MediaQuery.of(context).size.height * 0.3,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

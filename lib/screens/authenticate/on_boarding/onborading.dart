import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  bool onLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  void onPageChanged(int value) {
    _controller.jumpToPage(
      currentIndex + 1,
    );
  }

  void skip() {
    _controller.jumpToPage(
      3,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> onBoardingScreens = [
      onboarding(
        context,
        'Welcome to Awstore',
        'The ultimate destination for buying \nand selling digital arts and books.',
        Images.welcome,
        Colors.white,
        Palette.primary,
        Colors.white,
        const Color.fromARGB(255, 140, 63, 4),
        () {
          onPageChanged(currentIndex);
        },
        () => skip(),
        false,
      ),
      onboarding(
        context,
        'Find your thing',
        'The app offers a wide selection of digital arts \nand books, including paintings, photographs, ebooks.',
        Images.thing,
        Palette.primary,
        Colors.white,
        Colors.black,
        Colors.white,
        () {
          onPageChanged(currentIndex);
        },
        () => skip(),
        false,
      ),
      onboarding(
        context,
        'Easy-to-use interface',
        'Awstore has an easy-to-use interface that allows \nusers to search for specific items or browse by \ncategory.',
        Images.interface,
        Palette.primary,
        Colors.white,
        Colors.black,
        Colors.white,
        () {
          onPageChanged(currentIndex);
        },
        () => skip(),
        false,
      ),
      onboarding(
        context,
        'Profit from your work',
        'This is the perfect platform for artists and authors. \nCreate a profile, upload your artwork, and sell to \nwork to buyers all over the world.',
        Images.profit,
        Palette.primary,
        Colors.white,
        Colors.black,
        Colors.white,
        () {},
        () {},
        true,
      ),
    ];
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: onBoardingScreens,
      ),
    ));
  }
}

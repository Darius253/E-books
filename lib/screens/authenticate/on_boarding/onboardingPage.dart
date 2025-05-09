import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();
  List<Widget> onBoardingScreens = [];

  bool onLastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    onBoardingScreens = [
      OnboardingWidget(
        title: 'Welcome to Awstore',
        subtitle:
            'The ultimate destination for buying \nand selling digital arts and books.',
        image: Images.welcome,
        color: Colors.white,
        titleColor: Palette.primary,
        textColor: Colors.white,
        nextColor: const Color.fromARGB(255, 140, 63, 4),
        onTap: () {
          onPageChanged(currentIndex);
        },
        skip: () => skip(),
        lastIndex: false,
      ),
      OnboardingWidget(
        title: 'Find your thing',
        subtitle:
            'The app offers a wide selection of digital arts \nand books, including paintings, photographs, ebooks.',
        image: Images.thing,
        color: Palette.primary,
        textColor: Colors.white,
        titleColor: Colors.white,
        nextColor: Colors.black,
        onTap: () {
          onPageChanged(currentIndex);
        },
        skip: () => skip(),
        lastIndex: false,
      ),
      OnboardingWidget(
        title: 'Easy-to-use interface',
        subtitle:
            'Awstore has an easy-to-use interface that allows \nusers to search for specific items or browse by \ncategory.',
        image: Images.interface,
        color: Palette.primary,
        textColor: Colors.black,
        titleColor: Colors.white,
        nextColor: Colors.black,
        onTap: () {
          onPageChanged(currentIndex);
        },
        skip: () => skip(),
        lastIndex: true,
      ),
    ];

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
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: onBoardingScreens,
        ),
      ],
    ));
  }
}

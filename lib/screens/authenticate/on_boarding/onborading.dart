// ignore_for_file: prefer_const_constructors

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: currentIndex == 0 ? Palette.white : Palette.primary,
      child: PageView.builder(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
              onLastPage = (index == 3);
            });
          },
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SvgPicture.asset(
                      ondata[index].svgimg,
                      height: height * 0.6,
                    ),
                  ),
                ),
                Container(
                  color: currentIndex == 0 ? Palette.white : Palette.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ondata[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: currentIndex == 0
                                  ? Palette.primary
                                  : Palette.white,
                              fontSize: 23.5),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          ondata[index].desc,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Palette.primary
                                  : Palette.white,
                              fontSize: 14.5),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        onLastPage
                            ? GetStartedButton(
                                onPressed: () {
                                  Get.to(() => SelectSignUp());
                                },
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OnBoardButton(
                                    textColor: currentIndex == 0
                                        ? Palette.primary
                                        : Palette.white,
                                    backgroundColor: Colors.transparent,
                                    onPressed: () {
                                      _controller.jumpToPage(3);
                                    },
                                    text: 'Skip',
                                    bordercolor: currentIndex == 0
                                        ? Palette.primary
                                        : Palette.white,
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  OnBoardButton(
                                    textColor: currentIndex == 0
                                        ? Palette.white
                                        : Palette.black,
                                    backgroundColor: currentIndex == 0
                                        ? Palette.primary
                                        : Palette.white,
                                    onPressed: () {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeIn);
                                    },
                                    text: 'Next',
                                    bordercolor: currentIndex == 0
                                        ? Palette.primary
                                        : Palette.white,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    ));
  }
}

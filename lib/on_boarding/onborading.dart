// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/onboard_button.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      color: Palette.primary,
      child: PageView.builder(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SvgPicture.asset(
                      ondata[index].svgimg,
                      height: 400,
                    ),
                  ),
                ),
                Container(
                  color: Palette.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          ondata[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Palette.white,
                              fontSize: 26),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: Center(
                            child: Text(ondata[index].desc,
                                //softWrap: true,
                                style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                         OnBoardButton(
                                        obonpressed: () {},
                                        obtext: 'Skip', textcolor: Palette.white,
                                      ),
                                      SizedBox(width: 10,),
                                 OnBoardButton(obonpressed: () {  }, obtext: 'Next', textcolor: Palette.black,)
                          ],
                          
                        )
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

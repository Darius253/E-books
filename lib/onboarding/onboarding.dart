import 'package:reader_app/shared.dart/exports.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: SvgPicture.asset(
              'assets/images/onboarding.svg',
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "Reader APP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                fontFamily: Font.openSans),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: Font.openSans),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
          child: Row(
            children: [
              OnBoardingButton(
                backgroundColor: const Color.fromARGB(255, 144, 0, 255),
                color: Colors.black,
                onTap: () {
                  Get.to(() => const SignUp());
                },
                text: 'Join Now',
              ),
              const SizedBox(
                width: 10,
              ),
              OnBoardingButton(
                backgroundColor: Colors.transparent,
                color: const Color.fromARGB(255, 144, 0, 255),
                onTap: () {
                  Get.to(const SignIn());
                },
                text: 'Log In',
              ),
            ],
          ),
        )
      ],
    ));
  }
}

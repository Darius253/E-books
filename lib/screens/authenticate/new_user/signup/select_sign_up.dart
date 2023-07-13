import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SelectSignUp extends StatelessWidget {
  const SelectSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/aws_logo.png',
              width: width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.92,
                    child: const Text(
                      question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  CreaterButton(
                    onPressed: () {
                      Get.to(const SignUpPage());
                    },
                    backgroundColor: Palette.primary,
                    text: "Sign Up",
                    textColor: Colors.white,
                    width: width * 0.42,
                  ),
                  const SizedBox(height: 16),
                  CreaterButton(
                    onPressed: () {
                      Get.to(const SignIn());
                    },
                    backgroundColor: Colors.white,
                    text: "Sign In",
                    textColor: Palette.primary,
                    width: width * 0.42,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.042,
                    height: MediaQuery.of(context).size.height * 0.02,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.question_mark_sharp,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Tips',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const SizedBox(
                    width: 170,
                    child: Text(
                      tipMessage,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

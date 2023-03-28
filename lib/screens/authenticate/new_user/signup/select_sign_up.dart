import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SelectSignUp extends StatelessWidget {
  const SelectSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              'assets/images/aws_logo.png',
              width: width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
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
                  text: "Customer",
                  textColor: Colors.white,
                  width: width * 0.42,
                ),
                const SizedBox(height: 16),
                CreaterButton(
                  onPressed: () {
                    Get.to(const SignUpPage());
                  },
                  backgroundColor: Colors.white,
                  text: "Seller",
                  textColor: Palette.primary,
                  width: width * 0.28,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/tips.svg'),
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
    );
  }
}

import 'package:flutter/material.dart'; 
import '../../shared/exports.dart';

class CreaterPage extends StatelessWidget {
  const CreaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('assets/images/logo_small.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 280,
                  child: Text(question,
                  textAlign: TextAlign.center,
                   style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CreaterButton(
                  onPressed: () {
                    Get.to(WelcomePage());
                  },
                  backgroundColor: Palette.primary,
                  text: "Creator",
                  textColor: Colors.white,
                ),
                const SizedBox(height: 16),
                CreaterButton(
                  onPressed: () {
                    Get.to(WelcomePage());
                  },
                  backgroundColor: Colors.white,
                  text: "Customer",
                  textColor: Palette.primary,
                ),
              ],
            ),
          ),
          Container(
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

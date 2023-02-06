import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class Success extends StatelessWidget {
  final String title;
  final String about;
  const Success({
    super.key,
    required this.title,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              SvgPicture.asset(
                'assets/images/Completed_task _Outline.svg',
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                about,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Button(
                  text: 'Go back to login',
                  onTap: () => Get.off(() => const SignIn()))
            ],
          ),
        ),
      ),
    );
  }
}

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/ok-not-css.svg',
                height: MediaQuery.of(context).size.height * 0.55,
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                    text: 'Go back to login',
                    onTap: () => Get.off(() => const SignIn())),
              )
            ],
          ),
        ),
      ),
    );
  }
}

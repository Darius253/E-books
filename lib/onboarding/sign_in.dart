import 'package:flutter/material.dart';

import '../shared.dart/exports.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(113, 144, 0, 255),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SvgPicture.asset(
                'assets/images/sign_in.svg',
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

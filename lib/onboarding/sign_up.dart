import 'package:flutter/material.dart';
import '../shared.dart/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController phoneNumberController = TextEditingController();
  String accountType = 'creator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(113, 144, 0, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            ClipRRect(
              child: SvgPicture.asset(
                'assets/images/sign_up.svg',
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 20),
                    child: Column(children: [
                      creatorOrSubscriberButtons(),
                      const SizedBox(
                        height: 30,
                      ),
                      creatorOrSubscriber(),
                      const SizedBox(
                        height: 60,
                      ),
                      Button(
                        text: 'Sign Up',
                        word: 'Already Have an Account? Sign In',
                        onTap: () {
                          Get.to(() => const SignIn());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget creatorOrSubscriber() {
    if (accountType == 'creator') {
      return const CreatorSignUp();
    } else {
      return const SubscriberSignUp();
    }
  }

  Widget creatorOrSubscriberButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OnBoardingButton(
          backgroundColor: accountType == 'creator'
              ? const Color.fromARGB(255, 144, 0, 255)
              : Colors.transparent,
          color: accountType == 'creator'
              ? Colors.black
              : const Color.fromARGB(255, 144, 0, 255),
          onTap: () {
            setState(() {
              accountType = 'creator';
            });
          },
          text: 'Creator',
        ),
        OnBoardingButton(
          backgroundColor: accountType == 'subscriber'
              ? const Color.fromARGB(255, 144, 0, 255)
              : Colors.transparent,
          color: accountType == 'subscriber'
              ? const Color.fromARGB(255, 144, 0, 255)
              : Colors.black,
          onTap: () {
            setState(() {
              accountType = 'subscriber';
            });
          },
          text: 'Subscriber',
        ),
      ],
    );
  }
}

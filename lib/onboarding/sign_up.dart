import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String accountType = 'creator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 237, 112, 23),
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
            const Back(),
            Padding(
              padding: const EdgeInsets.only(top: 380.0),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
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
                    padding: const EdgeInsets.only(
                        top: 50.0, left: 20, right: 20, bottom: 10),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        creatorOrSubscriberButtons(),
                        const SizedBox(
                          height: 30,
                        ),
                        creatorOrSubscriber(),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                    ),
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
              ? const Color.fromARGB(242, 237, 112, 23)
              : Colors.transparent,
          color: accountType == 'creator'
              ? const Color.fromARGB(242, 237, 112, 23)
              : Colors.black,
          onTap: () {
            setState(() {
              accountType = 'creator';
            });
          },
          text: 'Creator',
        ),
        OnBoardingButton(
          backgroundColor: accountType == 'subscriber'
              ? const Color.fromARGB(242, 237, 112, 23)
              : Colors.transparent,
          color: accountType == 'subscriber'
              ? const Color.fromARGB(242, 237, 112, 23)
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

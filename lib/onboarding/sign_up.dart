import 'package:flutter/material.dart';
import '../shared.dart/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String accountType = 'creator';
  bool selected = false;

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 20),
                    child: Column(children: [
                      creatorOrSubscriberButtons(),
                      const SizedBox(
                        height: 30,
                      ),
                      creatorOrSubscriber(),
                      const SizedBox(
                        height: 15,
                      ),
                      termsAndConditions(),
                      const SizedBox(
                        height: 60,
                      ),
                      Button(
                        onPressed: () => _showMyDialog(),
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

  Row termsAndConditions() {
    return Row(children: [
      GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                color: selected
                    ? const Color.fromARGB(255, 237, 145, 33)
                    : Colors.white),
          )),
      const SizedBox(
        width: 3,
      ),
      const Text('I agree to the Terms of Services and Privacy Policy'),
    ]);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: accountType == 'creator'
              ? const Text('Sign Up as a Creator')
              : const Text('Sign Up as a Subscriber'),
          content: SingleChildScrollView(
            child: accountType == 'creator'
                ? ListBody(
                    children: const <Widget>[
                      Text('A Creator account allows you to: '),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '1. Upload your works on AwStore\n2. Purchase contents on AwStore\n3. Read and Download(optonal) contents on AwStore.'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Do you wish to proceed with creating an account type via this profile?'),
                    ],
                  )
                : ListBody(
                    children: const <Widget>[
                      Text('A Subscriber account allows you to: '),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '1. Purchase contents on AwStore.\n2. Read and Download(optional) contents on AwStore.'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Do you wish to proceed with creating an account type via this profile?'),
                    ],
                  ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Proceed',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              onPressed: () {
                formKey.currentState?.save();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

import 'package:flutter/material.dart';
import 'package:reader_app/shared.dart/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        const Back(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SvgPicture.asset(
              'assets/images/forgot_password.svg',
              height: MediaQuery.of(context).size.height / 2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Forgot\nPassword?',
              style: TextStyle(
                color: const Color.fromARGB(255, 237, 145, 33),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Don't Worry. We've got you\nPlease Enter the email address associated with your account",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty ? '@ Email' : null,
              onChanged: (value) {
                setState(() => email = value);
              },
              decoration: InputDecoration(
                hintText: '@ Email',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OnBoardingButton(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 237, 145, 33),
                text: 'Submit',
                onTap: () {},
                backgroundColor: const Color.fromARGB(255, 237, 145, 33))
          ]),
        ),
      ]),
    ));
  }
}

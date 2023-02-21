// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    IconButton(
                      onPressed: (() => Get.back()),
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SvgPicture.asset(
                    'assets/images/forgot_password.svg',
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Forgot\nPassword?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 237, 145, 33),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Don't Worry. We've got you!\nPlease Enter the email address associated with your account.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(214, 165, 165, 165)),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    //autovalidateMode: AutovalidateMode.always,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        suffixIcon:
                            const Icon(CupertinoIcons.mail, color: Colors.grey),
                        hintText: 'darius@gmail.com',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          fontFamily: Platform.isIOS
                              ? Font.sanfrancisco
                              : Font.proxinova,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(215, 161, 146, 135)),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(216, 237, 112, 23)),
                            borderRadius: BorderRadius.circular(8)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Button(
                      text: 'Send Code',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print(email);
                          Get.to(() => const VerifyEmail());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

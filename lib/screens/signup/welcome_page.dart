import 'package:flutter/material.dart';
import 'package:reader_app/screens/signup/creator_registration.dart';
import 'package:reader_app/shared/constants.dart';
import 'package:reader_app/widgets/text_buttons.dart';

import '../../shared/exports.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/welcome.png'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtons(bonTap: () {
                  Get.to(CreatorRegistration());
                }, btext: 'Creator'),
                Container(
                  width: 1,
                  height: 28,
                  color: Palette.grey,
                ),
                TextButtons(bonTap: () {
                  
                }, btext: 'Customer')
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // SizedBox(height: height * 0.04),
                      const Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        "Enter your password and setup account",
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.grey,
                            fontWeight: FontWeight.normal),
                      ),
                      //Name
                      SizedBox(height: height * 0.05),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Palette.primary),
                          ),
                          labelText: "Name",
                          hintText: "Blemano Emmanuel Tetteh",
                          hintStyle: TextStyle(fontSize: 18), //hint text style
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty ||
                        //       !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                        //     return "Enter a valid name";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),

                      //Email
                      SizedBox(height: height * 0.05),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Palette.primary),
                          ),
                          labelText: "Email",
                          hintText: "e.g.. name@email.com",
                          hintStyle: TextStyle(fontSize: 18), //hint text style
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty ||
                        //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //           .hasMatch(value)) {
                        //     return "Enter a valid email";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      //Phone Number
                      SizedBox(height: height * 0.05),
                      InternationalPhoneNumberInput(
                        onInputChanged: ((value) {}),
                        cursorColor: Colors.black,
                        formatInput: false,
                        selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                        inputDecoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Palette.primary),
                          ),
                          hintText: '123xxxxxxxx',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                      ),

                      SizedBox(height: height * 0.05),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Palette.primary),
                          ),
                          labelText: "Password",
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 18), //hint text style
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty ||
                        //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //           .hasMatch(value)) {
                        //     return "Enter a valid email";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      SizedBox(height: height * 0.05),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Palette.primary),
                          ),
                          labelText: "Password",
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(fontSize: 18), //hint text style
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty ||
                        //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //           .hasMatch(value)) {
                        //     return "Enter a valid email";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

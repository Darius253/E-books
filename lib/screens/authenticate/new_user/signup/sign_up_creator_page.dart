// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CreatorSignUpPage extends StatefulWidget {
  const CreatorSignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatorSignUpPage> createState() => _CreatorSignUpPageState();
}

class _CreatorSignUpPageState extends State<CreatorSignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _publishingHouseController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool value = false;
  String accountType = 'creator';
  bool selected = false;

  String username = '';
  String fullname = '';
  String password = '';
  String confirmpassword = '';
  String email = '';
  String phonenumber = '';
  String location = '';
  String publishingHouseName = '';

  bool publishing_house = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SizedBox(height: height * 0.04),
            const Text(
              "Do you want to sell",
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
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
                  borderSide: BorderSide(width: 3, color: Palette.primary),
                ),
                hintText: '123xxxxxxxx',
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: height * 0.05),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
    );
  }
}

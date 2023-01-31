// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SellerSignUpPage extends StatefulWidget {
  const SellerSignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SellerSignUpPage> createState() => _SellerSignUpPageState();
}

class _SellerSignUpPageState extends State<SellerSignUpPage> {
  final TextEditingController _artistnameController = TextEditingController();
  final TextEditingController _shopnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String artistname = '';
  String shopname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';

  String accountType = 'creator';
  bool selected = false;
  bool _obscureText = true;
  bool isChecked = false;

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
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _artistnameController,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  value!.length < 5 ? 'This field cannot be empty' : null,
              onChanged: (value) {
                setState(() => artistname = value);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.grey,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Palette.primary,
                  fontWeight: FontWeight.w400,
                ),
                labelText: "Artist Name",
                hintText: "Blemano Emmanuel Tetteh",
                hintStyle: TextStyle(fontSize: 18), //hint text style
                labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),

            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _shopnameController,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  value!.length < 5 ? 'This field cannot be empty' : null,
              onChanged: (value) {
                setState(() => shopname = value);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.grey,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Palette.primary,
                  fontWeight: FontWeight.w400,
                ),
                labelText: "Shop",
                hintText: "Enter Shop Name",
                hintStyle: TextStyle(fontSize: 18), //hint text style
                labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),

            //Email
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.grey,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Palette.primary,
                  fontWeight: FontWeight.w400,
                ),
                labelText: "Email",
                hintText: "e.g.. name@email.com",
                hintStyle: TextStyle(fontSize: 18), //hint text style
                labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return "Enter a valid email";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() => email = value);
              },
            ),

            //Phone Number
            SizedBox(height: height * 0.03),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Palette.grey),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InternationalPhoneNumberInput(
                  onInputChanged: ((value) {}),
                  cursorColor: Palette.primary,
                  formatInput: false,
                  selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                    border: InputBorder.none,
                    floatingLabelStyle: TextStyle(
                      fontSize: 14,
                      color: Palette.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            //Password
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.grey,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Palette.primary,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                labelText: "Password",
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 18), //hint text style
                labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return "Enter a valid email";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
            SizedBox(height: height * 0.03),
            //Confirm Password
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _obscureText,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                setState(() => confirmpassword = value);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palette.grey,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                floatingLabelStyle: TextStyle(
                  fontSize: 14,
                  color: Palette.primary,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                labelText: "Password",
                hintText: "Confirm Password",
                hintStyle: TextStyle(fontSize: 18), //hint text style
                labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return "Enter a valid email";
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: height * 0.01),
            TermsAndConditions(
                label:
                    "I agree to the Terms and Conditions of Services and Privacy Policy",
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                }),

             SizedBox(height: height * 0.01),
            //isChecked ?
            ConfirmButton(
              bbcolor: Palette.primary,
              bonPressed: () {},
              btext: 'Confirm',
            ),

             SizedBox(height: height * 0.03),
            OrLine(),

              SizedBox(height: height * 0.03),
            ExSignUpButton(
              image: Images.google,
              onTap: () {},
              text: 'Google',
            ),
            SizedBox(height: height * 0.02),
            ExSignUpButton(
              image: Images.facebook,
              onTap: () {},
              text: 'Facebook',
            ),
            SizedBox(height: height * 0.02),
            RichTextWidget(),
          ],
        ),
      ),
    );
  }
}

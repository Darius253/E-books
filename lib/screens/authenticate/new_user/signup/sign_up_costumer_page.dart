// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:reader_app/shared/exports.dart';

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({Key? key}) : super(key: key);

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = false;
  bool obscureConfirmPassword = false;
  String fullname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String? phonenumber;

  String accountType = 'customer';
  bool selected = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // SizedBox(height: height * 0.04),
            const Text(
              "Create an account",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              "Kindly provide your details to setup an account",
              style: TextStyle(
                  fontSize: 15,
                  color: Palette.grey,
                  fontWeight: FontWeight.normal),
            ),

            SizedBox(height: height * 0.03),

            //Username
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _fullnameController,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  value!.length < 5 ? 'This field cannot be empty' : null,
              onChanged: (value) {
                setState(() => fullname = value);
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(214, 165, 165, 165),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),

            //Email
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Enter your Email',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(214, 165, 165, 165),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
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
            IntlPhoneField(
              flagsButtonPadding: const EdgeInsets.only(left: 20),
              initialCountryCode: '+233',
              disableLengthCheck: false,
              pickerDialogStyle: PickerDialogStyle(
                  listTileDivider: const SizedBox.shrink(),
                  searchFieldInputDecoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Country/Country code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                  ),
                  searchFieldCursorColor: const Color.fromARGB(255, 41, 45, 50),
                  countryNameStyle:
                      const TextStyle(fontWeight: FontWeight.w500)),
              dropdownIcon: const Icon(
                Icons.arrow_drop_down,
                color: Color.fromARGB(255, 41, 45, 50),
              ),
              dropdownIconPosition: IconPosition.trailing,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
              ),
              onChanged: (phone) {
                setState(() {
                  phonenumber = phone.completeNumber;
                });
              },
              onCountryChanged: (country) {
                setState(() {
                  // selectedCountry = country.toString();
                });
              },
            ),
            //Password
            SizedBox(height: height * 0.03),
            TextFormField(
              controller: _passwordController,
              obscureText: !obscurePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: obscurePassword == true
                        ? const Icon(CupertinoIcons.eye, color: Colors.grey)
                        : const Icon(CupertinoIcons.eye_slash,
                            color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  labelText: 'Enter Password',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(214, 165, 165, 165),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  focusColor: const Color.fromARGB(216, 237, 112, 23),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(height: height * 0.03),
            //Confirm Password
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: !obscureConfirmPassword,
              validator: (value) {
                if (value != _passwordController.text || value!.isEmpty) {
                  return 'Please repeat password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  confirmpassword = value;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  confirmpassword = value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: obscureConfirmPassword == true
                        ? const Icon(CupertinoIcons.eye, color: Colors.grey)
                        : const Icon(CupertinoIcons.eye_slash,
                            color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(214, 165, 165, 165),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  focusColor: const Color.fromARGB(216, 237, 112, 23),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),

            SizedBox(height: height * 0.01),
            TermsAndConditions(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                }),

            SizedBox(height: height * 0.05),

            Button(
              onTap: () {
                if (_formKey.currentState!.validate() && isChecked == true) {
                  Get.to(() => VerifyEmail(
                        signUp: true,
                      ));
                } else {
                  Get.showSnackbar(GetSnackBar(
                    message:
                        'Please make sure you agree to our Terms and Condition.',
                    duration: Duration(seconds: 3),
                  ));
                }
              },
              text: 'Sign Up',
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
            signIn(context),
          ],
        ),
      ),
    );
  }
}

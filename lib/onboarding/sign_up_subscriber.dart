import 'package:flutter/material.dart';

import '../shared.dart/exports.dart';

class SubscriberSignUp extends StatefulWidget {
  const SubscriberSignUp({Key? key}) : super(key: key);

  @override
  State<SubscriberSignUp> createState() => _SubscriberSignUpState();
}

class _SubscriberSignUpState extends State<SubscriberSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username Field
        TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.name,
          validator: (value) =>
              value!.length < 5 ? 'Username should be 5 to 10 characters' : '',
          onChanged: (value) {
            setState(() => username = value);
          },
          decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              )),
        ),
        const SizedBox(
          height: 15,
        ),

        // Fullname field
        TextFormField(
          controller: _fullnameController,
          keyboardType: TextInputType.name,
          validator: (value) => value!.isEmpty
              ? 'Kindly Provide your Fullname or Pseudonym'
              : null,
          onChanged: (value) {
            setState(() => fullname = value);
          },
          decoration: InputDecoration(
              hintText: 'Fullname/Pseudonym',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              )),
        ),
        const SizedBox(
          height: 15,
        ),

        //PhoneNumber
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            // print(number.phoneNumber);
          },
          onInputValidated: (bool value) {
            // print(value);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
          ),
          ignoreBlank: false,
          hintText: 'Phone Number',
          selectorTextStyle: const TextStyle(color: Colors.black),
          textFieldController: phoneNumberController,
          formatInput: false,
          validator: (value) => value == null ? 'Enter Phone Number' : '',
          onFieldSubmitted: (value) {
            setState(() => phonenumber = value);
          },
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          onSaved: (PhoneNumber number) {
            setState(() => phonenumber = number as String);
          },
        ),
        const SizedBox(
          height: 15,
        ),

        // Email Field
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              value!.isEmpty ? 'Please Enter a valid email' : '',
          onChanged: (value) {
            setState(() => email = value);
          },
          decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              )),
        ),
        const SizedBox(
          height: 15,
        ),

        // Password Field
        TextFormField(
          obscureText: true,
          validator: (value) => value!.length > 6
              ? 'Password should be more than 5 characters'
              : '',
          onChanged: (value) {
            setState(() => password = value);
          },
          controller: _passwordController,
          decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              )),
        ),
        const SizedBox(
          height: 15,
        ),

        // Confirm Password Field
        TextFormField(
          obscureText: true,
          controller: _confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) => value != password
              ? ' Characters should match Password characters'
              : '',
          onChanged: (value) {
            setState(() => confirmpassword = value);
          },
          decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
              )),
        ),
      ],
    );
  }
}

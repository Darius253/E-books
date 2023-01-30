// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/confirm_button.dart';

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
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';

  String accountType = 'customer';
  bool selected = false;
  bool _obscureText = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
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
              "Enter your password and setup account",
              style: TextStyle(
                  fontSize: 15,
                  color: Palette.grey,
                  fontWeight: FontWeight.normal),
            ),
            //Name
            SizedBox(height: height * 0.03),
            //name
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
            ),

            //Email
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: const InputDecoration(
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

            SizedBox(height: height * 0.03),
            //Password
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
                    fontWeight: FontWeight.w600),
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
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Palette.primary),
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
                    fontWeight: FontWeight.w600),
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
              // isChecked ?
              ConfirmButton(bbcolor: Palette.primary, bonPressed: () {  }, btext: 'Confirm', ),
          ],
        ),
      ),
    );
  }

  // Future<void> _showMyDialog() async => showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: accountType == 'creator'
  //               ? const Text('Sign Up as a Creator')
  //               : const Text('Sign Up as a Subscriber'),
  //           content: SingleChildScrollView(
  //             child: accountType == 'creator'
  //                 ? ListBody(
  //                     children: const <Widget>[
  //                       Text('A Creator account allows you to: '),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                           '1. Upload your works on AwStore\n2. Purchase contents on AwStore\n3. Read and Download(optonal) contents on AwStore.'),
  //                       SizedBox(
  //                         height: 20,
  //                       ),
  //                       Text(
  //                           'Do you wish to proceed with creating an account type via this profile?'),
  //                     ],
  //                   )
  //                 : ListBody(
  //                     children: const <Widget>[
  //                       Text('A Subscriber account allows you to: '),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                           '1. Purchase contents on AwStore.\n2. Read and Download(optional) contents on AwStore.'),
  //                       SizedBox(
  //                         height: 20,
  //                       ),
  //                       Text(
  //                           'Do you wish to proceed with creating an account type via this profile?'),
  //                     ],
  //                   ),
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //                 child: const Text(
  //                   'Proceed',
  //                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
  //                 ),
  //                 onPressed: () {
  //                   if (formKey.currentState!.validate()) {
  //                     formKey.currentState?.save();

  //                     // loading();
  //                   }
  //                   Navigator.of(context).pop();
  //                 }),
  //           ],
  //         );
  //       },
  //     );

  // Future<void> loading() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: true, // user must tap button!
  //     builder: (BuildContext context) {
  //       return const AlertDialog(
  //         title: Text('Please Wait...'),
  //         content: SizedBox(
  //             width: 150,
  //             height: 100,
  //             child: Center(child: CircularProgressIndicator.adaptive())),
  //       );
  //     },
  //   );
}

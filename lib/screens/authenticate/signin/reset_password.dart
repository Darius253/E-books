// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/success.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = false;
  bool obscureConfirmPassword = false;

  String newPassword = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Column(
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
                  const Text('Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(209, 5, 17, 36),
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5),
                  const Text(
                      "Set the new password for your account so you can have access to Awstore and all it's features",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(214, 165, 165, 165))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //New Password
                  const Text(
                    'New Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _newPassword,
                    obscureText: !obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        newPassword = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        newPassword = value;
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: obscurePassword == true
                              ? const Icon(CupertinoIcons.eye,
                                  color: Colors.grey)
                              : const Icon(CupertinoIcons.eye_slash,
                                  color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                        hintText: 'Minimum of 8 Characters',
                        hintStyle: const TextStyle(
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

                  const SizedBox(
                    height: 20,
                  ),
                  //Confirm Password
                  const Text(
                    'Confirm New Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: _confirmPassword,
                    obscureText: !obscureConfirmPassword,
                    validator: (value) {
                      if (value != _newPassword.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: obscureConfirmPassword == true
                              ? const Icon(CupertinoIcons.eye,
                                  color: Colors.grey)
                              : const Icon(CupertinoIcons.eye_slash,
                                  color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                        ),
                        hintText: 'Confirm Password here',
                        hintStyle: const TextStyle(
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
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text('Password Strength',
                style: TextStyle(
                  color: Color.fromARGB(214, 165, 165, 165),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            FlutterPasswordStrength(
                password: _newPassword.text,
                duration: const Duration(milliseconds: 100),
                strengthCallback: (strength) {
                  debugPrint(strength.toString());
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Button(
                text: 'Change',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(newPassword);
                    print(confirmPassword);
                    Get.off(() => const Success(
                        title: 'Password Reset Successfully',
                        about: 'You can now login'));
                  }
                }),
          ]),
        ),
      )),
    );
  }
}

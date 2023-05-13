// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/authenticate/new_user/genre.dart';
import 'package:reader_app/shared/exports.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
           ),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/aws_logo.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height*0.1,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 30),
                  const Text('Welcome back, Darius!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(209, 5, 17, 36),
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5),
                  const Text(
                      'Enter your credentials to sign in to your account',
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
                children: [
                  //Email TextField
                  TextFormField(
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
                    decoration: InputDecoration(
                        suffixIcon:
                            const Icon(CupertinoIcons.mail, color: Colors.grey),
                        labelText: 'Email',
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
                  const SizedBox(
                    height: 20,
                  ),
                  //Password Field
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
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: (() => Get.to(() => const ForgotPassword())),
                  child: const Text('Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(190, 237, 112, 23))),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Button(
                text: 'Login',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(email);
                    print(password);
                    Get.offAll(() => const SelectGenre());
                  }
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 2,
                  color: const Color.fromARGB(255, 131, 130, 130),
                ),
                const Text(
                  'Or Continue with',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 2,
                  color: const Color.fromARGB(255, 131, 130, 130),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.032,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      color: Color.fromARGB(255, 11, 132, 238),
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/icons8-google.svg')),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
            const Text.rich(
              TextSpan(
                  text: 'By logging in, I have read and agreed to the ',
                  style: TextStyle(fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms and Condition, ',
                        style: TextStyle(
                            color: Color.fromARGB(190, 237, 112, 23),
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                    TextSpan(
                        text: 'Use Policy and Privacy Policy',
                        style: TextStyle(color: Color.fromARGB(190, 237, 112, 23),
                            fontWeight: FontWeight.w700,
                            fontSize: 12))
                  ]),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 24),
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
              child: Text('LOGO'),
            ),
            const SizedBox(height: 15),
            const Text('Welcome back, Darius!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(209, 5, 17, 36),
                  fontSize: 18,
                )),
            const SizedBox(height: 5),
            const Text('Enter your credentials to sign in to your account',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(214, 165, 165, 165))),
            const SizedBox(height: 20),
            Form(
                key: formKey,
                
                child:  Column(
                  children: [
                    //Email TextField
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(CupertinoIcons.mail, color: Colors.grey),
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(214, 165, 165, 165),
                            fontWeight: FontWeight.w400,
                          ),
                          focusColor: const Color.fromARGB(216, 237, 112, 23),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(216, 237, 112, 23)),
                              borderRadius: BorderRadius.circular(8)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    //Password Field
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(CupertinoIcons.eye, color: Colors.grey),
                          labelText: 'Enter Password',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(214, 165, 165, 165),
                            fontWeight: FontWeight.w400,
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
                ),),
          ]),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import '../shared.dart/exports.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 237, 112, 23),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            const Back(),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SvgPicture.asset(
                'assets/images/sign_in.svg',
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380.0),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontFamily: Platform.isIOS
                                ? Font.sanfrancisco
                                : Font.proxinova,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 238, 140, 19),
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                          child: Column(
                        children: [
                          // Email Field
                          TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value!.isEmpty
                                ? 'Please Enter a valid email or Username'
                                : null,
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                            decoration: const InputDecoration(
                                hintText: 'Email or Username',
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          // Password Field
                          TextFormField(
                            obscureText: true,
                            validator: (value) =>
                                value!.length < 6 ? 'Provide Password' : '',
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: SizedBox(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => const ForgotPassword());
                                  },
                                  child: Text(
                                    'Forgotten Password?',
                                    style: TextStyle(
                                        fontFamily: Platform.isIOS
                                            ? Font.sanfrancisco
                                            : Font.proxinova,
                                        color: const Color.fromARGB(
                                            255, 238, 140, 19),
                                        fontWeight: FontWeight.w700),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Button(
                            onPressed: () {},
                            text: 'Sign In',
                            word: "Don't have an Account? Sign In",
                            onTap: () {
                              Get.to(() => const SignUp());
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

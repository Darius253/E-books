import 'package:flutter/material.dart';
import 'package:reader_app/onboarding/reset_password.dart';
import 'package:reader_app/shared/exports.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: Form(
              key: _formKey,
              child: Column(children: [
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
                SvgPicture.asset(
                    'assets/images/Sending_emails_Monochromatic.svg'),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text('Verify your email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(209, 5, 17, 36),
                            fontSize: 24,
                          )),
                      const SizedBox(height: 5),
                      const Text('Enter OTP Sent to your Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromARGB(214, 165, 165, 165))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ],
                  ),
                ),
                PinCodeTextField(
                  appContext: context,
                  keyboardType: TextInputType.number,
                  pastedTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 237, 145, 33),
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  validator: (v) {
                    if (v!.length < 4) {
                      return "OTP cannot be less than 4-digits";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    fieldHeight: MediaQuery.of(context).size.height * 0.07,
                    fieldWidth: MediaQuery.of(context).size.width * 0.2,
                    activeFillColor: Colors.white,
                    selectedColor: const Color.fromARGB(255, 237, 145, 33),
                    inactiveColor: const Color.fromARGB(255, 158, 151, 143),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Button(
                    text: 'Verify',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print(otp);
                        Get.to(() => const ResetPassword());
                      }
                    })
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

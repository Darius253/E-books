import 'package:flutter/material.dart';
import 'package:reader_app/screens/signup/sign_up_creator_page.dart';
import '../../../shared/exports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String accountType = 'customer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/welcome.png'),
            ),
          ),
          const SizedBox(height: 16),
          creatorORcustomerButtons(),
          // const SizedBox(
          //   height: 16,
          // ),
          Expanded(child: SingleChildScrollView(child: creatorORcustomer())),
        ],
      ),
    );
  }

  Widget creatorORcustomer() {
    if (accountType == 'customer') {
      return const CustomerSignUpPage();
    } else {
      return const CreatorSignUpPage();
    }
  }

  Widget creatorORcustomerButtons() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtons(
            btext: 'Seller',
            // bbackgroundColor:
            //     accountType == 'creator' ? Palette.primary : Colors.transparent,
            bcolor:
                accountType == 'creator' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                accountType = 'creator';
              });
            },
            textcolor: accountType == 'creator' ? Palette.primary : Colors.grey,
          ),
          Container(
            width: 1,
            height: 26,
            color: Palette.grey,
          ),
          TextButtons(
            btext: 'Customer',
            //bbackgroundColor: accountType == 'customer' ? Palette.primary : Colors.transparent,
            bcolor: accountType == 'customer'
                ? Palette.primary
                : Colors.transparent,
            onTap: () {
              setState(() {
                accountType = 'customer';
              });
            },
            textcolor: accountType == 'creator' ? Colors.grey : Palette.primary,
          ),
        ],
      ),
    );
  }
}

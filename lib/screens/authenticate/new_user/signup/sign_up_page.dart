import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: MediaQuery.of(context).size.width * 0.22,
          pinned: true,
          snap: false,
          floating: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Welcome-amico.svg',
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ],
            ),
          ),
          title: Align(
              alignment: Alignment.center, child: creatorORcustomerButtons()),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(child: creatorORcustomer()),
        ),
      ],
    ));
  }

  Widget creatorORcustomer() {
    if (accountType == 'customer') {
      return const CustomerSignUpPage();
    } else {
      return const SellerSignUpPage();
    }
  }

  Widget creatorORcustomerButtons() {
    return SizedBox(
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            TextButtons(
              btext: 'Seller',
              bcolor: accountType == 'creator'
                  ? Palette.primary
                  : Colors.transparent,
              onTap: () {
                setState(() {
                  accountType = 'creator';
                });
              },
              textcolor:
                  accountType == 'creator' ? Palette.primary : Colors.grey,
              fsize: 20,
            ),
            Container(
              width: 1,
              height: 26,
              color: Palette.grey,
            ),
            TextButtons(
              btext: 'Customer',
              bcolor: accountType == 'customer'
                  ? Palette.primary
                  : Colors.transparent,
              onTap: () {
                setState(() {
                  accountType = 'customer';
                });
              },
              textcolor:
                  accountType == 'creator' ? Colors.grey : Palette.primary,
              fsize: 20,
            ),
          ],
        ),
      ),
    );
  }
}

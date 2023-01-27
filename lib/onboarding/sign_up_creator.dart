// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CreatorSignUp extends StatefulWidget {
  const CreatorSignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatorSignUp> createState() => _CreatorSignUpState();
}

class _CreatorSignUpState extends State<CreatorSignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _publishingHouseController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool value = false;
  String account_type = 'creator';
  bool selected = false;

  String username = '';
  String fullname = '';
  String password = '';
  String confirmpassword = '';
  String email = '';
  String phonenumber = '';
  String location = '';
  String publishingHouseName = '';

  bool publishing_house = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          // Username Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _usernameController,
            maxLength: 10,
            keyboardType: TextInputType.name,
            validator: (value) => value!.length < 5
                ? 'Username should be 5 to 10 characters'
                : '',
            onChanged: (value) {
              setState(() => username = value);
            },
            decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Fullname field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _fullnameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.isEmpty ? 'Kindly Provide your Fullname' : '',
            onChanged: (value) {
              setState(() => fullname = value);
            },
            decoration: InputDecoration(
                hintText: 'Fullname/Pseudonym',
                hintStyle: TextStyle(
                    fontFamily:
                        Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          //PhoneNumber
          InternationalPhoneNumberInput(
            autoValidateMode: AutovalidateMode.onUserInteraction,
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
            validator: (value) =>
                value!.length < 10 ? 'Enter Phone Number' : '',
            onFieldSubmitted: (value) {
              setState(() => phonenumber = value);
            },
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
          ),

          const SizedBox(
            height: 15,
          ),

          // Email Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmail ? '' : 'Provide a valid Email address',
            onChanged: (value) {
              setState(() => email = value);
            },
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Password Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            validator: (value) => value!.length < 6
                ? 'Password should more than 5 characters'
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
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                )),
          ),
          const SizedBox(
            height: 15,
          ),

          // Confirm Password Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          // Publishing House
          publishingHouse(),
          const SizedBox(
            height: 30,
          ),
          termsAndConditions(),
          const SizedBox(
            height: 60,
          ),
          Button(
            onPressed: () => _showMyDialog(),
            text: 'Sign Up',
            word: 'Already Have an Account? Sign In',
            onTap: () {
              Get.to(() => const SignIn());
            },
          ),
        ],
      ),
    );
  }

  Widget publishingHouse() {
    return Column(children: [
      GestureDetector(
        onTap: () {
          setState(() {
            publishing_house = !publishing_house;
          });
        },
        child: Row(children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                color: publishing_house
                    ? const Color.fromARGB(255, 237, 145, 33)
                    : Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('Publishing House', style: TextStyle(fontSize: 18)),
        ]),
      ),
      publishing_house == true
          ? Column(
              children: [
                TextFormField(
                  controller: _publishingHouseController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty
                      ? 'Please Provide Publishing house name'
                      : '',
                  onChanged: (value) {
                    setState(() => publishingHouseName = value);
                  },
                  decoration: InputDecoration(
                      hintText: 'Name of Publishing House',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily:
                            Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                      )),
                ),
                TextFormField(
                  controller: _locationController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value!.isEmpty ? 'Please Provide Location' : '',
                  onChanged: (value) {
                    setState(() => location = value);
                  },
                  decoration: InputDecoration(
                      hintText: 'Location of Publishing House',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily:
                            Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                      )),
                ),
              ],
            )
          : const SizedBox(),
    ]);
  }

  Widget termsAndConditions() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Row(children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: selected
                  ? const Color.fromARGB(255, 237, 145, 33)
                  : Colors.white),
        ),
        const SizedBox(
          width: 3,
        ),
        const Text('I agree to the Terms of Services and Privacy Policy'),
      ]),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: account_type == 'creator'
              ? const Text('Sign Up as a Creator')
              : const Text('Sign Up as a Subscriber'),
          content: SingleChildScrollView(
            child: account_type == 'creator'
                ? ListBody(
                    children: const <Widget>[
                      Text('A Creator account allows you to: '),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '1. Upload your works on AwStore\n2. Purchase contents on AwStore\n3. Read and Download(optonal) contents on AwStore.'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Do you wish to proceed with creating an account type via this profile?'),
                    ],
                  )
                : ListBody(
                    children: const <Widget>[
                      Text('A Subscriber account allows you to: '),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '1. Purchase contents on AwStore.\n2. Read and Download(optional) contents on AwStore.'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Do you wish to proceed with creating an account type via this profile?'),
                    ],
                  ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();

                    // loading();
                  }
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  Future<void> loading() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Please Wait...'),
          content: SizedBox(
              width: 150,
              height: 100,
              child: Center(child: CircularProgressIndicator.adaptive())),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:reader_app/services/signup_api.dart';
import 'package:reader_app/shared/exports.dart';

class SellerSignUpPage extends StatefulWidget {
  const SellerSignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SellerSignUpPage> createState() => _SellerSignUpPageState();
}

class _SellerSignUpPageState extends State<SellerSignUpPage> {
  final TextEditingController _artistnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String fullname = '';
  String? authorType;
  String email = '';
  String username = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = '';
  bool obscurePassword = false;
  bool obscureConfirmPassword = false;
  bool isChecked = false;
  int? userRoles;
  String userCountry = "";
  bool isloading = false;

  List<String> items = [
    'author-individual',
    'author-publication',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Create an account",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            const Text(
              "Kindly provide your details to setup an account",
              style: TextStyle(
                  fontSize: 14,
                  color: Palette.grey,
                  fontWeight: FontWeight.normal),
            ),
            //Name
            SizedBox(height: height * 0.03),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _artistnameController,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  value!.isEmpty ? 'This field cannot be empty' : null,
              onChanged: (value) {
                setState(() => fullname = value);
              },
              decoration: InputDecoration(
                  labelText: 'Full Name',
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
            SizedBox(height: height * 0.03),

            //username
            TextFormField(
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _usernameController,
              keyboardType: TextInputType.name,
              validator: (value) =>
                  value!.isEmpty ? 'This field cannot be empty' : null,
              onChanged: (value) {
                setState(() => username = value);
              },
              decoration: InputDecoration(
                  labelText: 'Enter Username',
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

            SizedBox(height: height * 0.03),

            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                barrierLabel: 'Choose Account Type',
                hint: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Choose Account Type',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: authorType,
                onChanged: (value) {
                  if (value == 'author-individual') {
                    setState(() {
                      authorType = value as String;
                      userRoles = 2;
                    });
                  } else {
                    setState(() {
                      authorType = value as String;
                      userRoles = 4;
                    });
                  }
                },
                buttonStyleData: ButtonStyleData(
                  height: height * 0.075,
                  width: width,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: authorType == null
                          ? const Color.fromARGB(255, 217, 217, 217)
                          : const Color.fromARGB(255, 237, 112, 23),
                    ),
                    color: authorType == null
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : Colors.white,
                  ),
                  // elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 8,
                  offset: const Offset(-5, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),

            //Email
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Enter your email',
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
            SizedBox(height: height * 0.03),

            //Phone Number
            IntlPhoneField(
              flagsButtonPadding: const EdgeInsets.only(left: 20),
              initialCountryCode: '+233',
              disableLengthCheck: false,
              pickerDialogStyle: PickerDialogStyle(
                  listTileDivider: const SizedBox.shrink(),
                  searchFieldInputDecoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Country/Country code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(88, 28, 55, 90),
                      ),
                    ),
                  ),
                  searchFieldCursorColor: const Color.fromARGB(255, 41, 45, 50),
                  countryNameStyle:
                      const TextStyle(fontWeight: FontWeight.w500)),
              dropdownIcon: const Icon(
                Icons.arrow_drop_down,
                color: Color.fromARGB(255, 41, 45, 50),
              ),
              dropdownIconPosition: IconPosition.trailing,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(88, 28, 55, 90),
                  ),
                ),
              ),
              onChanged: (phone) {
                setState(() {
                  phonenumber = phone.completeNumber;
                });
              },
              onCountryChanged: (country) {
                setState(() {
                  userCountry = country.name;
                });
              },
            ),

            //Password
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordController,
              obscureText: !obscurePassword,
              validator: (value) {
                if (value!.length < 7) {
                  return 'Password should be more than 6 characters.';
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
                        ? const Icon(CupertinoIcons.eye, color: Colors.grey)
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
            SizedBox(height: height * 0.03),
            //Confirm Password
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _confirmPasswordController,
              obscureText: !obscureConfirmPassword,
              validator: (value) {
                if (value != _passwordController.text || value!.isEmpty) {
                  return 'Please repeat password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  confirmpassword = value;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  confirmpassword = value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: obscureConfirmPassword == true
                        ? const Icon(CupertinoIcons.eye, color: Colors.grey)
                        : const Icon(CupertinoIcons.eye_slash,
                            color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                  labelText: 'Confirm Password',
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

            SizedBox(height: height * 0.01),
            TermsAndConditions(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                }),

            SizedBox(height: height * 0.01),

            isloading == false
                ? Button(
                    onTap: () async {
                      if (_formKey.currentState!.validate() &&
                          isChecked == true &&
                          phonenumber.isNotEmpty &&
                          userRoles != null) {
                        setState(() {
                          isloading = true;
                        });
                        try {
                          await SignUp().creatorSignup(
                            username,
                            fullname,
                            email,
                            phonenumber,
                            password,
                            userCountry,
                            userRoles!,
                          );

                          setState(() {
                            isloading = false;
                          });

                          // Get.to(() => VerifyEmail(
                          //       signUp: true,
                          //     ));
                        } catch (error) {
                          Get.snackbar(
                            'Error Creating Account:',
                            'Something went wrong. Please try again later.',
                            duration: const Duration(seconds: 5),
                            colorText: Colors.red,
                            backgroundColor: Colors.black,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          setState(() {
                            isloading = false;
                          });
                        }
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          message: 'All fields are required.',
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                    text: 'Sign Up',
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Palette.primary,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),

            // SizedBox(height: height * 0.03),
            // const OrLine(),

            // SizedBox(height: height * 0.03),
            // ExSignUpButton(
            //   image: Images.google,
            //   onTap: () {},
            //   text: 'Google',
            // ),
            // SizedBox(height: height * 0.02),
            // ExSignUpButton(
            //   image: Images.facebook,
            //   onTap: () {},
            //   text: 'Facebook',
            // ),
            SizedBox(height: height * 0.02),
            signIn(context),
          ],
        ),
      ),
    );
  }
}

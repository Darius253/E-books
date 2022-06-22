import 'package:flutter/material.dart';

class CreatorSignUp extends StatefulWidget {
  const CreatorSignUp({Key? key}) : super(key: key);

  @override
  State<CreatorSignUp> createState() => _CreatorSignUpState();
}

class _CreatorSignUpState extends State<CreatorSignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String username = '';
  String fullname = '';
  String password = '';
  String confirmpassword = '';
  String email = '';
  String phonenumber = '';
  String location = '';
  String publishingHouse = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Username Field
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.isEmpty ? 'Please Provide a Username' : null,
            onChanged: (value) {
              setState(() => username = value);
            },
            decoration: const InputDecoration(
                hintText: 'Username',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          // Fullname field
          TextFormField(
            controller: _fullnameController,
            keyboardType: TextInputType.name,
            validator: (value) =>
                value!.isEmpty ? 'Kindly Provide your Fullname' : null,
            onChanged: (value) {
              setState(() => fullname = value);
            },
            decoration: const InputDecoration(
                hintText: 'Fullname',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          //PhoneNumber
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value!.isEmpty ? 'Please Provide Your Phone Number' : null,
            onChanged: (value) {
              setState(() => phonenumber = value);
            },
            decoration: const InputDecoration(
                hintText: 'Phone Number',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? 'Please Enter a valid email' : null,
            onChanged: (value) {
              setState(() => email = value);
            },
            decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          // Password Field
          TextFormField(
            obscureText: true,
            validator: (value) =>
                value?.length != null ? 'Provide Password' : null,
            onChanged: (value) {
              setState(() => password = value);
            },
            controller: _passwordController,
            decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 15,
          ),

          // Confirm Password Field
          TextFormField(
            obscureText: true,
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => value != password
                ? ' Characters should match Password characters'
                : null,
            onChanged: (value) {
              setState(() => confirmpassword = value);
            },
            decoration: const InputDecoration(
                hintText: 'Confirm Password',
                hintStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class AccountDetails extends StatefulWidget {
  final String id;
  const AccountDetails({super.key, required this.id});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  String? name;
  String? phoneNumber;
  String? email;
  String? value;
  String? country;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              authorDetails(width, height, 'Writer/Author', '50', '250'),
              aboutProfile(
                width,
                height,
                'Darius',
                '+233261140382',
                'trondarius13@gmail.com',
                'Ghana',
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Button(
                    text: 'Edit',
                    onTap: () {
                      editForm(
                        context,
                        width,
                      );
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget aboutProfile(
    double width,
    double height,
    String name,
    String phoneNumber,
    String email,
    String country,
  ) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            row(
              name,
              'Username',
            ),
            row(
              phoneNumber,
              'Phone',
            ),
            row(
              email,
              'Email',
            ),
            row(
              country,
              'Country',
            ),
          ],
        ));
  }

  Widget row(
    String data,
    String title,
  ) {
    return Container(
      color: const Color(0xFFFEFAF6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            // const Expanded(child: SizedBox()),
            Text(
              data,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future editForm(
    BuildContext context,
    double width,
  ) {
    return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            children: [
              textForm(
                PhosphorIcons.regular.user,
                'Username',
                (value) {
                  name = value;
                },
                _nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              InternationalPhoneNumberInput(
                maxLength: 11,
                textFieldController: _phoneNumberController,
                onInputChanged: ((value) {
                  setState(() {
                    phoneNumber = value.phoneNumber;
                    country = value.isoCode;
                  });
                }),
                cursorColor: Colors.black,
                formatInput: true,
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN),
                inputDecoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: '123456789',
                  hintStyle: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textForm(
                PhosphorIcons.regular.envelope,
                'Email',
                (String? value) {
                  email = value;
                },
                _emailController,
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                  text: 'Update',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(name);
                      print(phoneNumber);
                      print(email);
                    }
                  })
            ],
          ),
        );
      },
    );
  }

  Widget textForm(
    IconData icon,
    String hintText,
    Function(String)? onChanged,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your details for field';
        }
        return null;
      },
      onChanged: onChanged,
      onFieldSubmitted: onChanged,
      decoration: InputDecoration(
          suffixIcon: Icon(icon, color: Colors.grey),
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Color.fromARGB(214, 165, 165, 165),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(216, 237, 112, 23)),
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget authorDetails(
    double width,
    height,
    String authorOrArtist,
    numberOfBooks,
    followers,
  ) {
    return Container(
      width: width,
      height: height * 0.35,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 250, 217, 194)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appBar(width, height, "Profile", false),
          Center(
            child: Container(
              height: height * 0.15,
              width: width * 0.35,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'Darius Tron',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  authorOrArtist,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  'Total purchased: $numberOfBooks',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  '$followers followers',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
        ],
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../shared/exports.dart';

class Payment extends StatefulWidget {
  final String price;
  const Payment({super.key, required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _textEditingController = TextEditingController();
  String? phoneNumber;
  String? selectedNetwork;
  final List<String> items = [
    'MTN Momo',
    'Vodafone Cash',
    'AirtelTigo Money',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        appBar(width, height, 'Payment'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.05,
                    height: height * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Text('Request Payment',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Container(
                    color: Colors.grey,
                    width: width * 0.003,
                    height: height * 0.03,
                  ),
                  Container(
                    width: width * 0.05,
                    height: height * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Text('Confirm Payment',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(height: height * 0.075),
              const Text('Enter your Mobile Money mobile number',
                  style: TextStyle(fontWeight: FontWeight.w400)),
              SizedBox(height: height * 0.05),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  barrierLabel: 'Select Network',
                  hint: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Select Network',
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
                  value: selectedNetwork,
                  onChanged: (value) {
                    setState(() {
                      selectedNetwork = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: height * 0.075,
                    width: width,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: selectedNetwork == null
                            ? const Color.fromARGB(255, 217, 217, 217)
                            : const Color.fromARGB(255, 237, 112, 23),
                      ),
                      color: selectedNetwork == null
                          ? const Color.fromARGB(255, 217, 217, 217)
                          : Colors.white,
                    ),
                    // elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
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
              SizedBox(height: height * 0.05),
              TextFormField(
                controller: _textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  label: const Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(216, 237, 112, 23)),
                      borderRadius: BorderRadius.circular(50)),
                  border: phoneNumber != null
                      ? OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(216, 237, 112, 23)),
                          borderRadius: BorderRadius.circular(50))
                      : OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(216, 237, 112, 23)),
                          borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(height: height * 0.15),
              button(height, widget.price, () {}),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Center(
                    child: Text(
                  'Please make sure the account balance us greater than GHS ${widget.price} otherside the payment will be not be completed',
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )),
              )
            ],
          ),
        )
      ])),
    );
  }

  Widget appBar(double width, height, String title) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.065, vertical: height * 0.025),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: const Color.fromARGB(249, 41, 45, 50),
                  size: width * 0.06,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                title,
                softWrap: true,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ]));
  }

  Widget button(double height, String price, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.08,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 112, 23),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          'Pay GHS $price',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}

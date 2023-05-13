import 'package:flutter/material.dart';

import '../../../shared/exports.dart';

class RequestPayment extends StatefulWidget {
  
  const RequestPayment({super.key, });

  @override
  State<RequestPayment> createState() => _RequestPaymentState();
}

class _RequestPaymentState extends State<RequestPayment> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.075),
          const Text('Enter your Mobile Money mobile number',
              style: TextStyle(fontWeight: FontWeight.w400)),
          SizedBox(height: height * 0.05),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              barrierLabel: 'Select Network',
              hint: const Row(
                children: [
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
        
        ],
      ),
    );
  }


}

import 'package:flutter/material.dart';

import '../../../shared/exports.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                  const Text('Request Payment'),
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
                  const Text('Confirm Payment'),
                ],
              ),
              SizedBox(height: height * 0.05),
              Text('Enter your Mobile Money mobile number'),
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
}

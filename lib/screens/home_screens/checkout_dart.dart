import 'package:flutter/material.dart';

import '../../shared/exports.dart';

class CheckOut extends StatelessWidget {
  final String price;
  const CheckOut({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          appBar(width, height, 'Checkout'),
          Container(
            width: width,
            height: height * 0.1,
            decoration:
                const BoxDecoration(color: Color.fromARGB(226, 229, 229, 229)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.04,
                horizontal: width * 0.07,
              ),
              child: const Text(
                'ITEM SUMMARY',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 1.5),
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.07, vertical: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        'GHS $price',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                   Text(
                    'No additional fees included yet.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6)
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }

  Widget appBar(double width, height, String title) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.065, vertical: height * 0.025),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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

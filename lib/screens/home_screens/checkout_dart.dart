import 'package:flutter/material.dart';

import '../../shared/exports.dart';

class CheckOut extends StatelessWidget {
  final String price;
  final String name;
  final String artistOrAuthor;
  const CheckOut(
      {super.key,
      required this.price,
      required this.name,
      required this.artistOrAuthor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.03),
            child: const Text(
              'Item(s)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2.0,
              color: const Color.fromARGB(239, 229, 229, 229),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.3,
                          height: height * 0.13,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        const Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: 'Artist: ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.6)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: artistOrAuthor,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ]),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Text(
                              'GHS $price',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        Text(
                          'REMOVE',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text('x1'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
            ),
            child: button(
              height,
              price,
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

  Widget button(double height, String price) {
    return GestureDetector(
      onTap: () {},
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

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../shared/exports.dart';

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
          itemContainer(width, height),
          SizedBox(
            height: height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
            ),
            child: button(height, price,
                () => paymentMethod(context, width, height, price)),
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

  Widget itemContainer(double width, double height) {
    return Padding(
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
              const Row(
                children: [
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
    );
  }

  Future paymentMethod(
      BuildContext context, double width, double height, String price) {
    return showModalBottomSheet(
        context: context,
        builder: (contex) => BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3.0, sigmaY: 3.0, tileMode: TileMode.mirror),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.03),
                width: width,
                height: height * 0.4,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total GHS $price',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Expanded(child: SizedBox()),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        print('Card');
                      },
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.payment,
                              color: Color.fromARGB(255, 140, 63, 4),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          const Text(
                            'Pay with Card',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.size,
                                duration: const Duration(milliseconds: 300),
                                alignment: Alignment.topCenter,
                                child: Payment(
                                  price: price,
                                )));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_android_sharp,
                            color: Color.fromARGB(255, 140, 63, 4),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          const Text(
                            'Pay via Mobile Money',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

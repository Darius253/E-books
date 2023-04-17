import 'package:flutter/material.dart';
import '../../../shared/exports.dart';

class Payment extends StatefulWidget {
  final String price;
  const Payment({super.key, required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int currentpageIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const RequestPayment(),
      ConfirmPayment(
        price: ' ${widget.price}',
      )
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        color: currentpageIndex == 1
                            ? Colors.grey.withOpacity(0.6)
                            : Colors.black,
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
                  Text('Request Payment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: currentpageIndex == 1
                            ? Colors.grey.withOpacity(0.6)
                            : Colors.black,
                      )),
                  Container(
                    color: Colors.grey,
                    width: width * 0.003,
                    height: height * 0.03,
                  ),
                  Container(
                    width: width * 0.05,
                    height: height * 0.025,
                    decoration: BoxDecoration(
                        color: currentpageIndex == 0
                            ? Colors.grey.withOpacity(0.6)
                            : Colors.black,
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
                  Text('Confirm Payment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: currentpageIndex == 0
                            ? Colors.grey.withOpacity(0.6)
                            : Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: currentpageIndex == 0 ? height * 0.5 : height * 0.85,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: screens,
                  onPageChanged: (value) {
                    currentpageIndex = value;
                  },
                ),
              ),
              currentpageIndex == 0
                  ? Column(
                      children: [
                        button(height, widget.price, () {
                          setState(() {
                            currentpageIndex = 1;
                          });
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInExpo);
                        }),
                        SizedBox(height: height * 0.05),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: Center(
                              child: Text(
                            'Please make sure the account balance us greater than GHS ${widget.price} otherside the payment will be not be completed',
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          )),
                        )
                      ],
                    )
                  : const SizedBox()
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

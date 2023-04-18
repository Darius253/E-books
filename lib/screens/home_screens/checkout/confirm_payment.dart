import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ConfirmPayment extends StatelessWidget {
  final String price;
  const ConfirmPayment({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/ok-not-css.svg',
                height: MediaQuery.of(context).size.height * 0.55,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.005),
                    width: width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(181, 249, 249, 249),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                          'Item Successfully Purchased',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        )),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        const Text(
                          'Reference Number: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          'Total Amount: GHS $price',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

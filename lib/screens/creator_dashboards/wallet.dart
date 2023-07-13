import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/checkout/request_payment.dart';

Widget wallet(double width, double height) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:20.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: width ,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAD9C2),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFF8C3E04)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.025),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BALANCE',
                        style: TextStyle(
                          color: Color(0xFF272727),
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'GHS 3,300.98',
                        style: TextStyle(
                          color: Color(0xFFED7117),
                          fontSize: 18,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.44,
                        ),
                      ),
                    ]),
              )),
          const RequestPayment()
        ],
      ),
    ),
  );
}

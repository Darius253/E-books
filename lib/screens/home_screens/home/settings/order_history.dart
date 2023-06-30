import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(width, height, 'Order History', false),
            Container(
              width: width,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.25,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFF08B42),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: book.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                        child: ListTile(
                          leading: Container(
                            width: 48,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage(book[index].image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          title: Text(
                            book[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: const Text(
                            '23 Feb, 2023 8:15 PM ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Text(
                            book[index].price,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

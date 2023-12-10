import 'package:flutter/material.dart';
import 'package:reader_app/models/orders.dart';
import 'package:reader_app/shared/exports.dart';

import '../../../../services/customer_order.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  String bearerToken = '';

  @override
  void initState() {
    super.initState();
    _getToken();
    _fetchCompletedOrders();
  }

  Future<void> _getToken() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        bearerToken = person.token;
      });
    }
  }

  Future<List<Order>> _fetchCompletedOrders() async {
    // Replace with the actual bearer token.
    try {
      final AllOrders allOrders = AllOrders();
      List<Order> orders = await allOrders.getOrders(bearerToken);
      return orders.where((order) => order.orderPayment != null).toList();
    } catch (error) {
      return [];
    }
  }

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
              child: FutureBuilder<List<Order>>(
                future: _fetchCompletedOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Palette.primary,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error fetching completed orders');
                  } else {
                    final completedOrders = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: completedOrders.length,
                      itemBuilder: (context, index) {
                        final order = completedOrders[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 10,
                          ),
                          child: Column(
                            children: order.orderItems!.map((orderItem) {
                              return ListTile(
                                leading: Container(
                                  width: 48,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        orderItem.featuredImageUrl!,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  orderItem.titleOfBook!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                  'GHS ${orderItem.salePrice!}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

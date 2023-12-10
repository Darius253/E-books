import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reader_app/models/orders.dart';
import 'package:reader_app/services/customer_order.dart';
import 'package:reader_app/shared/exports.dart';

class PurchasedBooks extends StatefulWidget {
  const PurchasedBooks({Key? key}) : super(key: key);

  @override
  State<PurchasedBooks> createState() => _PurchasedBooksState();
}

class _PurchasedBooksState extends State<PurchasedBooks> {
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
    try {
      final AllOrders allOrders = AllOrders();
      List<Order> orders = await allOrders.getOrders(
        bearerToken,
      );
      return orders.where((order) => order.orderPayment != null).toList();
    } catch (error) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Order>>(
      future: _fetchCompletedOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator.adaptive(
            backgroundColor: Palette.primary,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ));
        } else if (snapshot.hasError) {
          return const Text('Error fetching completed orders');
        } else {
          final completedOrders = snapshot.data ?? [];
          return MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            mainAxisSpacing: 16,
            crossAxisSpacing: 5,
            itemCount: completedOrders.length,
            itemBuilder: (BuildContext context, int index) {
              final order = completedOrders[index];
              return Column(
                children: order.orderItems!.map((orderItem) {
                  return books(
                    width,
                    Random().nextInt(150) + 50.5,
                    orderItem.authorName!,
                    orderItem.titleOfBook!,
                    14,
                    context,
                    orderItem.featuredImageUrl!,
                    orderItem,
                  );
                }).toList(),
              );
            },
          );
        }
      },
    );
  }
}

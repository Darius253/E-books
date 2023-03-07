import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PurchaseCard extends StatelessWidget {
  const PurchaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
            mainAxisSpacing: 16,
            crossAxisSpacing: 1,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const Text(
                'Author',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Title',
                style: TextStyle(fontSize: 12.0,),
              ),
              const Text(
                'Read',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.red),
              )
            ],
          );
        },
      ),
    );
  }
}

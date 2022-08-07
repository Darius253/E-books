import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Doubles.headerMargin),
            child: Text('Store'),
          ),
          backgroundColor: Colors.white,
          border: Border.all(width: 0.0, color: Colors.transparent),
        ),
        SliverToBoxAdapter(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(Doubles.bodyMargin,
                Doubles.bodyMargin, Doubles.bodyMargin, 100.0),
            children: [
              SeparatedColumn(
                separatorBuilder: () => const SizedBox(height: 20.0),
                children: List.generate(
                  10,
                  (index) => Hero(
                    tag: index,
                    child: const BookStoreItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

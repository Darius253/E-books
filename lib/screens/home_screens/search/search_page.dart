import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: const SearchField(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  'Browse Tags',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                    height: height * 0.75, child: const SearchTags()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

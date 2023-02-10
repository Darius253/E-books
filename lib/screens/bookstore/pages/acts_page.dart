
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ActsPage extends StatefulWidget {
  const ActsPage({super.key});

  @override
  State<ActsPage> createState() => _ActsPageState();
}

class _ActsPageState extends State<ActsPage> {
  String genrePage = 'acts';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Acts",
              style: TextStyle(
                fontSize: 24,
                color: Palette.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: width * 0.90,
              child: const Divider(
                height: 1.0,
                color: Color.fromARGB(255, 71, 71, 71),
              ),
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                itemCount: infodata.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        BookInfo(
                          bookInfoData: infodata[index],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (index != infodata.length - 1)
                          SizedBox(
                            width: width * 0.90,
                            child: const Divider(
                              height: 1.0,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
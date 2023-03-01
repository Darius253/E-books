
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class MysteryPage extends StatefulWidget {
  const MysteryPage({super.key});

  @override
  State<MysteryPage> createState() => _MysteryPageState();
}

class _MysteryPageState extends State<MysteryPage> {
  String genrePage = 'mystery';
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
              "Mystery",
              style: TextStyle(
                fontSize: 24,
                color: Palette.black,
                fontWeight: FontWeight.w500,
              ),
            ),
           SizedBox(
              height: height * 0.01,
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
                    height: height * 0.221,
                    child: Column(
                      children: [
                        BookInfo(
                          bookInfoData: infodata[index],
                        ),
                        SizedBox(
                          height: height * 0.018,
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

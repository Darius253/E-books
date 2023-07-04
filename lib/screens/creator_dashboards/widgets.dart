import 'package:flutter/material.dart';

class RevenueRange extends StatefulWidget {
  final double height;
  final double width;
  const RevenueRange({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<RevenueRange> createState() => _RevenueRangeState();
}

class _RevenueRangeState extends State<RevenueRange> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: const ShapeDecoration(
                  color: Color(0xFFED7117),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.5, color: Color(0xFFED7117)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  'Today',
                  style: TextStyle(
                    color: Color(0xFFFEFAF6),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Ink(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.5, color: Color(0xFFED7117)),
                  ),
                ),
                child: const Text(
                  'Month',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Ink(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.5, color: Color(0xFFED7117)),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  'All TIme',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: widget.width,
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
        
       
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

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

Widget textField(
  double height,
  String label,
  String sublabel,
  String? text,
  Function(String) onchanged,
) {
  return Form(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: sublabel,
              style: const TextStyle(
                color: Color(0xFFA5A5A5),
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
        // height: height * 0.1,
        child: TextFormField(
          keyboardType: TextInputType.text,
          onChanged: onchanged,
          initialValue: text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    ],
  ));
}

Widget descriptiontextField(
  double height,
  String label,
  String sublabel,
  String? description,
  Function(String) onchanged,
) {
  return Form(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: sublabel,
              style: const TextStyle(
                color: Color(0xFFA5A5A5),
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: height * 0.35,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFD9D9D9),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: TextFormField(
          initialValue: description,
          maxLines: 300,
          onChanged: onchanged,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  ));
}

Widget tags(double width, double height, String label, Function()? ontap,
    Widget? tagsWidget) {
  return InkWell(
    onTap: ontap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: width,
          height: height * 0.075,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFFD9D9D9),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: tagsWidget,
        ),
      ],
    ),
  );
}

class RelatedGenres extends StatefulWidget {
  final String genre;
  final Genre genres;
  final Function(bool isSelected) onSelect;

  const RelatedGenres({
    super.key,
    required this.genre,
    required this.genres,
    required this.onSelect,
  });

  @override
  State<RelatedGenres> createState() => _RelatedGenresState();
}

class _RelatedGenresState extends State<RelatedGenres> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        setState(() {
          widget.onSelect(!widget.genres.isSelected);
        });
      },
      child: Container(
        height: height * 0.03,
        decoration: BoxDecoration(
            color: widget.genres.isSelected ? Palette.primary : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color:
                    widget.genres.isSelected ? Palette.primary : Colors.grey)),
        child: Center(
          child: Text(widget.genre),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD9D9D9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final dashedPath = Path();
    const double dashWidth = 4; // Width of each dash
    const double dashSpace = 4; // Space between each dash

    // Top border
    dashedPath.moveTo(0, 0);
    for (double startX = 0;
        startX < size.width;
        startX += dashWidth + dashSpace) {
      dashedPath.lineTo(startX, 0);
      dashedPath.moveTo(startX + dashWidth, 0);
    }

    // Right border
    dashedPath.moveTo(size.width, 0);
    for (double startY = 0;
        startY < size.height;
        startY += dashWidth + dashSpace) {
      dashedPath.lineTo(size.width, startY);
      dashedPath.moveTo(size.width, startY + dashWidth);
    }

    // Bottom border
    dashedPath.moveTo(size.width, size.height);
    for (double startX = size.width;
        startX > 0;
        startX -= dashWidth + dashSpace) {
      dashedPath.lineTo(startX, size.height);
      dashedPath.moveTo(startX - dashWidth, size.height);
    }

    // Left border
    dashedPath.moveTo(0, size.height);
    for (double startY = size.height;
        startY > 0;
        startY -= dashWidth + dashSpace) {
      dashedPath.lineTo(0, startY);
      dashedPath.moveTo(0, startY - dashWidth);
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

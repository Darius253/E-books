import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CarouselCard extends StatefulWidget {
  final BookInfoData infodata;
  const CarouselCard({super.key, required this.infodata});

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard>
    with TickerProviderStateMixin {
  //late AnimationController controller;

  @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 5),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.26,
        width: width * 0.82,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          image: DecorationImage(
            image: AssetImage(Images.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.030,
            ),
            Image.asset(
              widget.infodata.image,
              height: height * 0.20,
            ),
            SizedBox(
              width: width * 0.020,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.infodata.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  'by  ${widget.infodata.author}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 211, 210, 210)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:
                          width * 0.35, 
                      height: 2.5,
                      child: const LinearProgressIndicator(
                        value: 0.67,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.020,
                    ),
                    Text(
                      '${(0.67 * 100).toInt()}%',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 211, 210, 210)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

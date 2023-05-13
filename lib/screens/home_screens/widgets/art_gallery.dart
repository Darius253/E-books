import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ArtGallery extends StatelessWidget {
  const ArtGallery({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 400),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 100.0,
                child: FlipAnimation(
                  child: widget,
                ),
              ),
              children: [
                artCategory(width, height, 'New Arts for You'),
                SizedBox(
                    height: height * 0.48,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return art(width * 0.65, height * 0.34, 'Darius Tron',
                              'Golden Palm', 'Dreamland Gallery', '1,500', 17, context);
                        })),
                SizedBox(
                  height: height * 0.04,
                ),
                artCategory(width, height, 'Auctions'),
                SizedBox(
                    height: height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return art(
                              width * 0.55,
                              height * 0.2,
                              'Darius Tron',
                              'Golden Palm',
                              'Dreamland Gallery',
                              'Jan 19 at 6:00pm GMT',
                              13, context);
                        })),
                SizedBox(
                  height: height * 0.02,
                ),
                artCategory(
                  width,
                  height,
                  'Weekly Trends',
                ),
                SizedBox(
                    height: height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return art(width * 0.55, height * 0.2, 'Darius Tron',
                              'Golden Palm', 'Dreamland Gallery', '1,500', 17, context);
                        })),
                SizedBox(
                  height: height * 0.02,
                ),
                artCategory(width, height, 'Popular Arts'),
                SizedBox(
                    height: height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return art(width * 0.55, height * 0.2, 'Darius Tron',
                              'Golden Palm', 'Dreamland Gallery', '1,500', 17, context);
                        })),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget artCategory(double width, height, String category) {
    return Padding(
        padding: EdgeInsets.only(left: width * 0.07, bottom: height * 0.02),
        child: Text(
          category,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ));
  }
}

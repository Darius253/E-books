import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CarouselCard extends StatelessWidget {
  final BookInfoData infodata;
  const CarouselCard({super.key, required this.infodata});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200.0,
      width: 350.0,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Images.background),
        fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(infodata.image, height: height * 0.15,),
          Column(
            children: [
              Text('${infodata.title} \n ${infodata.author}'),
              Text('${infodata.title} \n ${infodata.author}'),
            ],
          )
        ],
      ),
    );
  }
}

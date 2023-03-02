import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.025),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(width, 'How I Met Your Mother'),
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: Container(
                    width: width * 0.7,
                    height: height * 0.4,
                    
                    decoration: BoxDecoration(
                      // image: DecorationImage(image: image),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                bookInfo(width, height),
                SizedBox(
                  height: height * 0.04,
                ),
                const Text(
                  'Book Decription',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                   
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  'The star of truTV’s hit show Impractical Jokers - alongside veteran sci-fi and horror writer Darren Wearmouth - delivers a chilling and wickedly fun supernatural novel in the vein of The Strain, in which a beautiful new subway line in New York City unearths an ancient dark horror that threatens the city’s utter destruction and the balance of civilization itself... read more',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar(double width, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(249, 41, 45, 50),
            size: width * 0.06,
          ),
        ),
        SizedBox(
          width: width * 0.12,
        ),
        Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        ),
        SizedBox(
          width: width * 0.12,
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            CupertinoIcons.share,
            color: Colors.black,
            size: width * 0.06,
          ),
        ),
        const SizedBox(
          width: 0.0,
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            CupertinoIcons.info_circle,
            color: Colors.black,
            size: width * 0.06,
          ),
        ),
      ],
    );
  }

  Widget bookInfo(double width, height) {
    return Center(
      child: Column(
        children: [
          const Text(
            'How I Met Your Mother',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            'Darius Tron',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                '7000 ratings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  const Text(
                    '5.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: width * 0.03,
                    color: const Color.fromARGB(244, 255, 217, 0),
                  )
                ],
              ),
              const Text(
                '74 Comments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

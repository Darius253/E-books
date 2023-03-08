import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ArtDetails extends StatefulWidget {
  final String artName;
  final String artistName;
  final String price;
  const ArtDetails(
      {super.key,
      required this.artName,
      required this.artistName,
      required this.price});

  @override
  State<ArtDetails> createState() => _ArtDetailsState();
}

class _ArtDetailsState extends State<ArtDetails> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      appBar(width, height, widget.artName),
      Padding(
          padding: EdgeInsets.only(top: height * 0.075),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    child: moreAboutArt(width, height, '')),
                SizedBox(
                    height: height * 0.35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return art(
                              width * 0.55,
                              height * 0.2,
                              widget.artistName,
                              'Golden Palm',
                              'Dreamland Gallery',
                              '1,500',
                              17);
                        })),
                SizedBox(
                  height: height * 0.03,
                ),
                booksType(width, 'Comments'),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return commentsCard(width, height);
                      },
                      itemCount: 4),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ])))
    ])));
  }

  Widget appBar(double width, height, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(249, 41, 45, 50),
              size: width * 0.06,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                overflow: TextOverflow.ellipsis),
          ),
          const Expanded(
            child: SizedBox(),
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
            onTap: () {
              setState(() {
                liked = !liked;
              });
            },
            child: Icon(
              liked == false ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
              color: liked == false ? Colors.black : Colors.red,
              size: width * 0.06,
            ),
          ),
        ],
      ),
    );
  }

  Widget moreAboutArt(double width, height, String year) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Container(
          width: width * 0.8,
          height: height * 0.4,
          decoration: BoxDecoration(
              // image: DecorationImage(image: image),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey),
        ),
      ),
      SizedBox(
        height: height * 0.02,
      ),
      Row(
        children: [
          Text(
            widget.artistName,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
          const Expanded(child: SizedBox()),
          const Text(
            '2023',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 17, color: Colors.grey),
          )
        ],
      ),
      SizedBox(
        height: height * 0.0075,
      ),
      Text(widget.artName,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 23,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 165, 165, 165))),
      SizedBox(
        height: height * 0.04,
      ),
      artDetails(width, height),
      SizedBox(
        height: height * 0.01,
      ),
      Text(
        'GHS ${widget.price}',
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            color: Color.fromARGB(255, 140, 63, 4)),
      ),
      SizedBox(
        height: height * 0.04,
      ),
      button(
        height,
      ),
      SizedBox(
        height: height * 0.04,
      ),
      artist(width, height),
      SizedBox(
        height: height * 0.01,
      ),
      const Text(
        "The artwork is quite large and the golden ring is depicted as if it's casting a golden light around the rainbow palm. This artwork was widely praised for its use of color and symbolism. The golden ring is said to represent the preciousness and value of human touch, while the rainbow palm represents diversity, hope and vitality. The painting was also notable for its attention to detail, with the brushstrokes used to depict the golden ring and the textures of the skin on the palm being particularly striking.",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: height * 0.04,
      ),
      Text(
        'Other works by ${widget.artistName}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: height * 0.04,
      ),
    ]);
  }

  Widget artDetails(double width, height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        artInfo('Medium', 'Digital Art', width),
        SizedBox(
          height: height * 0.02,
        ),
        artInfo('Materials', 'Photoshop, Illustrator, Lightroom.', width),
        SizedBox(
          height: height * 0.02,
        ),
        artInfo('Size', 'D64 x 48 cm', width),
        SizedBox(
          height: height * 0.02,
        ),
        artInfo('Rarity', 'Unique', width),
        SizedBox(
          height: height * 0.02,
        ),
        artInfo('Certificate of Authenticity', 'Included', width),
        SizedBox(
          height: height * 0.02,
        ),
        const Divider(
          color: Color.fromARGB(255, 247, 191, 151),
        ),
      ],
    );
  }

  Widget artInfo(String info, details, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.25,
          child: Text(
            info,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 165, 165, 165)),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        SizedBox(
          width: width * 0.5,
          child: Text(
            details,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  Widget button(
    double height,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height * 0.08,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 112, 23),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 123, 64, 0.35),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(30)),
        child: const Center(
            child: Text(
          'Purchase',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Widget artist(double width, height) {
    return ListTile(
      leading: Container(
        height: height * 0.1,
        width: width * 0.15,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      ),
      title: Text(
        widget.artistName,
        style: const TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
      ),
      subtitle: const Text(
        'Artist',
        style: TextStyle(
            color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
      ),
      trailing: Container(
        width: width * 0.2,
        height: height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey),
        ),
        child: const Center(
          child: Text(
            'Follow',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 140, 63, 4),
            ),
          ),
        ),
      ),
    );
  }
}

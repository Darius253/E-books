import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class AuthorPreview extends StatefulWidget {
  final String authorName;
  const AuthorPreview({super.key, required this.authorName});

  @override
  State<AuthorPreview> createState() => _AuthorPreviewState();
}

class _AuthorPreviewState extends State<AuthorPreview> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            authorDetails(width, height, 'Writer/Author', '50', '250', () {
              setState(() {
                isFollowing = !isFollowing;
              });
              print(isFollowing);
            }),
            aboutProfile(width, height,
                'Lorem ipsum dolor sit amet consectetur. Lectus in diam est libero id viverra magnis amet. Id velit placerat ac cursus massa leo ultrices velit pellentesque. Duis sed placerat et morbi consectetur potenti amet pulvinar vel. Parturient ullamcorper vitae risus risus viverra turpis. Pharetra arcu pharetra lacinia consequat et... more'),
            const Divider(),
            booksbyAuthor(width, height),
          ],
        ),
      )),
    );
  }

  Widget booksbyAuthor(double width, height) {
    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Books by Author',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              SizedBox(
                height: height * 0.65,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemCount: 16,
                    itemBuilder: (BuildContext context, int index) {
                      return bookCover(width, height);
                    }),
              )
            ],
          ),
        ));
  }

  Widget bookCover(double width, height) {
    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.015, bottom: height * 0.005, right: width * 0.04),
      child: Container(
        height: height * 0.3,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget aboutProfile(double width, height, String bio) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.025),
        child: Text(
          bio,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ));
  }

  Widget appBar(double width, height, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.07, vertical: height * 0.025),
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
        ],
      ),
    );
  }

  Widget authorDetails(
    double width,
    height,
    String authorOrArtist,
    numberOfBooks,
    followers,
    Function()? ontap,
  ) {
    return Container(
      width: width,
      height: height * 0.45,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 250, 217, 194)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appBar(width, height, "Author's Profile"),
          Center(
            child: Container(
              height: height * 0.15,
              width: width * 0.35,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            widget.authorName,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, height: 2),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  authorOrArtist,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  'No.of books: $numberOfBooks',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  '$followers followers',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          InkWell(
            onTap: ontap,
            child: Container(
              width: width * 0.3,
              height: height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(68, 62, 4, 2),
                border:
                    Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
              ),
              child: isFollowing == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_fill_badge_plus,
                          size: width * 0.075,
                          color: const Color.fromARGB(255, 140, 63, 4),
                        ),
                        const Text(
                          'Follow',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 140, 63, 4),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_badge_checkmark,
                          size: width * 0.075,
                          color: const Color.fromARGB(255, 140, 63, 4),
                        ),
                        const Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 140, 63, 4),
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}

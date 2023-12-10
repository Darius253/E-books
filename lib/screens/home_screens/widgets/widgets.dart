// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reader_app/models/orders.dart';
import 'package:reader_app/screens/home_screens/library/purchased_book_preview.dart';

import 'package:reader_app/shared/exports.dart';

Widget pageButton(double height, PhosphorIconData icon, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Palette.primary,
      ),
      child: Center(
        child: PhosphorIcon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget changePage(double height, double width, int currentPage, int lastPage,
    Function()? leftButton, Function()? rightButton) {
  return lastPage != 0
      ? Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: [
              currentPage > 1
                  ? pageButton(
                      height,
                      PhosphorIcons.regular.arrowArcLeft,
                      leftButton,
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                width: width * 0.05,
              ),
              Text('$currentPage of $lastPage'),
              SizedBox(
                width: width * 0.05,
              ),
              currentPage != lastPage
                  ? pageButton(
                      height,
                      PhosphorIcons.regular.arrowRight,
                      rightButton,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        )
      : const Text('Sorry, there are no books related to this genre.');
}

Widget bookCover(double width, double height, String image, Function()? onTap) {
  return Padding(
    padding: EdgeInsets.only(
      right: width * 0.04,
    ),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.3,
        height: height * 0.2,
        decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(1, 8, 5, 0.349),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ],
            border: Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
            borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
              imageUrl: image,
              filterQuality: FilterQuality.low,
              fit: BoxFit.fill,
              placeholder: (context, url) => loader()),
        ),
      ),
    ),
  );
}

Widget itemType(double width, String type) {
  return Text(
    type,
    style: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
  );
}

Widget appBar(double width, height, String title, bool actions) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: width * 0.05, vertical: height * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Platform.isAndroid
              ? Icon(
                  PhosphorIcons.regular.arrowLeft,
                  color: const Color.fromARGB(249, 41, 45, 50),
                  size: width * 0.06,
                )
              : Icon(
                  CupertinoIcons.arrow_left,
                  color: const Color.fromARGB(249, 41, 45, 50),
                  size: width * 0.06,
                ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        SizedBox(
          width: width * 0.3,
          child: Text(
            title,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        actions == true
            ? InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.share,
                  color: Colors.black,
                  size: width * 0.06,
                ),
              )
            : const SizedBox.shrink(),
        actions == true
            ? InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.info_circle,
                  color: Colors.black,
                  size: width * 0.06,
                ),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}

Widget relatedGenres(
  String genre,
) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)),
    child: Center(
      child: Text(genre),
    ),
  );
}

Widget commentsCard(
    double width, double height, String? name, String? comment) {
  return Padding(
    padding: EdgeInsets.only(
      right: width * 0.04,
    ),
    child: Container(
      width: width * 0.75,
      height: height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 140, 63, 4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name ?? 'Fantastic',
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            comment ??
                'I love this book. I recommend it to everyone. It’s fantastic. I like the suspence and ',
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            name ?? 'Fantastic',
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ),
  );
}

Widget bookInfo(double width, height, String title, author, Function()? ontap,
    List<int> ratings, List<String> comments, int pages) {
  double totalRatings = 0;

  if (ratings.isNotEmpty) {
    for (var rating in ratings) {
      totalRatings += rating;
    }

    double averageRating = totalRatings / ratings.length;
    totalRatings = double.parse(averageRating.toStringAsFixed(2));
  } else {
    totalRatings = 0.0;
  }
  return Center(
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            author,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${ratings.length} ratings',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                Text(
                  totalRatings.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            Text(
              '${comments.length} Comments',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              '$pages Pages',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget button(double height, String price, String bookTitle, String author) {
  return GestureDetector(
    onTap: () {
      Get.to(CheckOut(
        price: price,
        name: bookTitle,
        artistOrAuthor: author,
      ));
    },
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
          borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Text(
        'Pay GHS $price',
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      )),
    ),
  );
}

Widget art(double? width, double? height, String? artist, String? name,
    String? gallery, String? price, double? fontSize, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: width! * 0.07,
    ),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.size,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.bottomCenter,
            child: ArtDetails(
              artName: name!,
              artistName: artist!,
              price: price!,
            ),
            isIos: true),
      ),
      child: artist == null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: Colors.black),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: Colors.black),
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Text(
                  artist,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  name!,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(gallery!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: height * 0.03,
                ),
                Text('GHS $price',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 237, 112, 23))),
              ],
            ),
    ),
  );
}

Widget books(double? width, double? height, String author, String title,
    double fontSize, BuildContext context, String image, OrderItem book) {
  return Padding(
    padding: EdgeInsets.only(
      left: width! * 0.07,
    ),
    child: InkWell(
      onTap: () async {
        loading(
          context,
        );
        String? file;
        await GetPdfFile().createFileOfPdfUrl(book.fileUrl!).then((f) {
          file = f.path;
        });

        Navigator.pop(context);
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.size,
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.bottomCenter,
              child: Preview(
                bookTitle: book.titleOfBook!,
                authorName: book.authorName!,
                image: image,
                bookUrl: file!,
              ),
              isIos: true),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height! * 0.03,
          ),
          Text(
            author,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Opacity(
            opacity: 0.60,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text('Read',
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 237, 112, 23))),
        ],
      ),
    ),
  );
}

void loading(
  BuildContext context,
) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Palette.primary,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      });
}

class GetPdfFile {
  Future<File> createFileOfPdfUrl(String url) async {
    Completer<File> completer = Completer();
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}

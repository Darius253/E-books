import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookInfo extends StatelessWidget {
  final BookInfoData bookInfoData;
  BookInfo({super.key, required this.bookInfoData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(bookInfoData.image,
        height: 130,
        width: 80,
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Text(bookInfoData.title),
            Text('by + ${bookInfoData.author}'),
            SizedBox(
              height: 5,
            ),
            Text(bookInfoData.desc),
            Text(bookInfoData.price),
          ],
        )
      ],
    );
  }
}


class BookInfoData {
  final String image;
  final String title;
  final String author;
  final String desc;
  final String price;

  BookInfoData(this.image, this.title, this.author, this.desc, this.price);
}

List<BookInfoData> infodata = [
    BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
  BookInfoData(Images.tbook1, 'title', 'Michael Seth Starr', lorem, 'GHS 89'),
];
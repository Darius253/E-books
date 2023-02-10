import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookInfo extends StatelessWidget {
  final BookInfoData bookInfoData;
  BookInfo({super.key, required this.bookInfoData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Image.asset(bookInfoData.image,
          height: 130,
          width: 80,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookInfoData.title, style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              Text('by ${bookInfoData.author}'),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 220,
                child: Text(bookInfoData.desc, style: TextStyle(
                  fontSize: 11,
    
                ),)),
              Text(bookInfoData.price, style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
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
    BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
     BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
  BookInfoData(Images.tbook1, 'Don Rickles: Merchant of Venom', 'Michael Seth Starr', lorem, 'GHS 89'),
];
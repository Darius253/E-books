// import 'package:flutter/material.dart';
// import 'package:reader_app/shared/exports.dart';

// class BookCover extends StatelessWidget {
//   final VoidCallback onTap;
//   final double height;
//   final double width;
//   final BookData bookData;
//   const BookCover(
//       {super.key,
//       required this.onTap,
//       required this.height,
//       required this.width, required this.bookData});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               bookData.image,
//               height: height,
//               width: width,
//             ),
//             Text(bookData.name!, style: TextStyle(
//               fontSize: 11,
//             ),),
//             const SizedBox(
//               height: 6,
//             ),
//             Text(bookData.price!,
//               style: TextStyle(
//                 fontSize: 13,
//               ), ),
//           ],
//         ),
//       ),
//     );
//   }
// }

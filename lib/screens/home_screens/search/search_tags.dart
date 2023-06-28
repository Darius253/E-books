import 'package:flutter/material.dart';
import 'package:reader_app/models/genre_model.dart';

class SearchTags extends StatelessWidget {
  const SearchTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.095),
      child: GridView.builder(
        itemCount: genres.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 60,
            crossAxisSpacing: 40,
            mainAxisSpacing: 30),
        itemBuilder: (context, index) {
          return Container(
            decoration: ShapeDecoration(
              color: const Color(0xFFFAD9C2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Center(
              child: Text(
                genres[index].genre,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

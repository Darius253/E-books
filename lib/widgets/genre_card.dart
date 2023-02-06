import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  GenreCard({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 10,
        color: Palette.genrecolor,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              color: Colors.red,
              child: Text(
                genre.text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8,),
            Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage(genre.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Colors.white,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

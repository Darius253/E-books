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
    return Expanded(
      child: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromARGB(232, 140, 63, 4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Center(
                child: Text(
                  genre.text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            ClipPath(
              clipper: genre.clipper,
              child: Image.asset(
                genre.image,
                filterQuality: FilterQuality.high,
                width: width * 0.2,
                height: height * 0.1,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Column grid() {
  return Column(children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenreCard(
          genre: genres[0],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[1],
        ),
      ],
    ),
    const SizedBox(
      width: 25,
    ),
    Row(
      children: [
        GenreCard(
          genre: genres[2],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[3],
        ),
      ],
    ),
    const SizedBox(
      width: 25,
    ),
    Row(
      children: [
        GenreCard(
          genre: genres[4],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[5],
        ),
      ],
    ),
    const SizedBox(
      width: 25,
    ),
    Row(
      children: [
        GenreCard(
          genre: genres[6],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[7],
        ),
      ],
    ),
    const SizedBox(
      width: 25,
    ),
    Row(
      children: [
        GenreCard(
          genre: genres[8],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[9],
        ),
      ],
    ),
    const SizedBox(
      width: 25,
    ),
    Row(
      children: [
        GenreCard(
          genre: genres[10],
        ),
        const SizedBox(
          width: 17,
        ),
        GenreCard(
          genre: genres[11],
        ),
      ],
    )
  ]);
}

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  const GenreCard({
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
        height: height * 0.02,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color.fromARGB(232, 140, 63, 4)),
        child: SizedBox(
          width: width * 0.4,
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
      ),
    );
  }
}

Widget grid(double width, height) {
  return AnimationLimiter(
    child: SizedBox(
        height: height*0.75,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.025,
                mainAxisExtent: height*0.1,
                mainAxisSpacing: height*0.02),
            itemCount: genres.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: GenreCard(
                      genre: genres[index],
                    ),
                  ),
                ),
              );
            })),
  );
}

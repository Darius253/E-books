import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  final Function(bool isSelected) onSelect;
  const GenreCard({
    super.key,
    required this.genre,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {
          onSelect(!genre.isSelected);
        },
        child: Stack(
          children: [
            Container(
              height: height * 0.09,
              width: width * 0.45,
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
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ClipPath(
                      clipper: genre.clipper,
                      child: Image.asset(
                        genre.image,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
            ),
            genre.isSelected == true
                ? Positioned(
                    left: 130,
                    top: 10,
                    child: Container(
                      width: width * 0.07,
                      height: height * 0.03,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 0, 128, 0),
                      ),
                      child: const Icon(
                        CupertinoIcons.checkmark_alt,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class GenreSelectionGrid extends StatefulWidget {
  final Function(List<Genre>) onGenresSelected;
  const GenreSelectionGrid({super.key, required this.onGenresSelected});

  @override
  State<GenreSelectionGrid> createState() => _GenreSelectionGridState();
}

class _GenreSelectionGridState extends State<GenreSelectionGrid> {
  List<Genre> selectedGenres = [];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimationLimiter(
      child: SizedBox(
          height: height * 0.75,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: width * 0.025,
                  mainAxisExtent: height * 0.1,
                  mainAxisSpacing: height * 0.02),
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
                        onSelect: (isSelected) {
                          setState(() {
                            genres[index].isSelected = isSelected;
                            if (isSelected) {
                              selectedGenres.add(genres[index]);
                            } else {
                              selectedGenres.remove(genres[index]);
                            }
                          });
                          widget.onGenresSelected(selectedGenres);
                        },
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}

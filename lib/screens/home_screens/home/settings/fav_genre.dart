import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class FavouriteGenre extends StatefulWidget {
  const FavouriteGenre({super.key});

  @override
  State<FavouriteGenre> createState() => _FavouriteGenreState();
}

class _FavouriteGenreState extends State<FavouriteGenre> {
  List<Genre> selectedGenres = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: ListView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const Text('Hello, Darius!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(235, 237, 112, 23),
                                fontSize: 16,
                              )),
                          const SizedBox(height: 8),
                          const Text('Update your Favourite Genres',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(251, 0, 0, 0))),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.032),
                        ],
                      ),
                    ),
                    GenreSelectionGrid(
                      onGenresSelected: (selectedGenres) {
                        setState(() {
                          this.selectedGenres = selectedGenres;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Button(
                      text: 'Done',
                      onTap: () {
                        saveSelectedGenres();
                        selectedGenres.isNotEmpty
                            ? Get.back()
                            : Get.snackbar('Genre', 'Select atleast one genre',
                                borderRadius: 0.0,
                                duration: const Duration(seconds: 5),
                                snackPosition: SnackPosition.BOTTOM);
                      },
                    )
                  ],
                ))),
      ),
    );
  }

  void saveSelectedGenres() {
    print(selectedGenres);
  }
}
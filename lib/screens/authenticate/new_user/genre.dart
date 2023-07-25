import 'package:flutter/material.dart';
import 'package:reader_app/models/boxes.dart';
import 'package:reader_app/models/favGenres.dart';
import '../../../shared/exports.dart';

class SelectGenre extends StatefulWidget {
  const SelectGenre({super.key});

  @override
  State<SelectGenre> createState() => _SelectGenreState();
}

class _SelectGenreState extends State<SelectGenre> {
  List<int> selectedGenres = [];

  
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
                          const Text(
                              'Please select at least one genre that you like to read. This will help us recommend books  based on your interests',
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
                  genres: genres,
                  selectedGenres: selectedGenres,
                  onGenresSelected: (selectedGenres) {
                    setState(() {
                      this.selectedGenres = selectedGenres;
                    });
                  },
                ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: Button(
                        text: 'Next',
                        onTap: () {
                          saveSelectedGenres();
                          selectedGenres.isNotEmpty
                              ? Get.to(const HomePage())
                              : Get.snackbar(
                                  'Genre', 'Select atleast one genre',
                                  borderRadius: 0.0,
                                  duration: const Duration(seconds: 5),
                                  snackPosition: SnackPosition.BOTTOM);
                        },
                      ),
                    )
                  ],
                ))),
      ),
    );
  }

  void saveSelectedGenres() {
    boxGenres.put('favGenres', FavGenres(genres: selectedGenres));
    
  }
}

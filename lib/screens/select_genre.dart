import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';


class SelectGenre extends StatelessWidget {
   SelectGenre({super.key});
   

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Hello, Manny!!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Palette.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Please select 3 genres that you like to read. This will help us recommend books  based on your interests",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Palette.black,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              GridView.builder(
                  itemCount: genres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GenreCard(
                      genre: genres[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}



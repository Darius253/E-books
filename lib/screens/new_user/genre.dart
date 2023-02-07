import 'package:flutter/material.dart';
import 'package:reader_app/widgets/genre_card.dart';

class SlectGenre extends StatefulWidget {
  const SlectGenre({super.key});

  @override
  State<SlectGenre> createState() => _SlectGenreState();
}

class _SlectGenreState extends State<SlectGenre> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List genres = <ListTile>[
      
      // genreCard(width, height, 'Horro', 'horro.svg'),
      // genreCard(width, height, 'Adventure', 'adventure.svg'),
      // genreCard(width, height, 'Hisstory', 'history.svg'),
      // genreCard(width, height, 'Mystery', 'mystery.svg'),
      // genreCard(width, height, 'Science', 'science.svg'),
      // genreCard(width, height, 'Romance', 'romance.svg'),
      // genreCard(width, height, 'Comedy', 'comedy.svg'),
      // genreCard(width, height, 'Fiction', 'fiction.svg'),
      // genreCard(width, height, 'Poetry', 'poetry.svg'),
      // genreCard(width, height, 'Arts', 'arts.svg'),
      // genreCard(width, height, 'Crime', 'crime.svg'),
      // genreCard(width, height, 'Sports', 'sports.svg'),
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Please select 3 genres that you like to read. This will help us recommend books  based on your interests',
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
                    genreCard(width, height, 'Horro', 'romance.svg'),
            //               GridView.count(  
            //     crossAxisCount: 3,  
            //     crossAxisSpacing: 4.0,  
            //     mainAxisSpacing: 8.0,  
            //     children: List.generate(genres.length, (index) {  
            //       return genreCard(width, height, genre, image);  
                    
            //     }  
            //     )  
            // ) 
                  ],
                ),
              ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookStore extends StatefulWidget {
  const BookStore({Key? key}) : super(key: key);

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  String genrePage = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'BookStore',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 3),
          switchButtons(),
          Expanded(child: chipSwitch(genrePage)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.085,
          ),
        ],
      ),
    );
  }

  Widget chipSwitch(String genrePage) {
    return genrePage != 'All' ? BookPage(genre: genrePage) : const AllPage();
  }

  Widget switchButtons() {
    return Row(
      children: [
        GenreButton(
          onTap: () => updateGenre('All'),
          text: 'All',
          bcolor: genrePage == 'All' ? Palette.primary : Colors.transparent,
          brcolor: genrePage == 'All' ? Colors.transparent : Palette.grey,
          textcolor: genrePage == 'All' ? Colors.white : Palette.grey,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index].genre;
              return GenreButton(
                onTap: () => updateGenre(genre),
                text: genre,
                bcolor:
                    genrePage == genre ? Palette.primary : Colors.transparent,
                brcolor: genrePage == genre ? Colors.transparent : Palette.grey,
                textcolor: genrePage == genre ? Colors.white : Palette.grey,
              );
            },
          ),
        ),
      ],
    );
  }

  void updateGenre(String genre) {
    setState(() {
      genrePage = genre;
    });
  }
}

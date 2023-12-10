import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:reader_app/shared/exports.dart';

class BookStore extends StatefulWidget {
  const BookStore({Key? key, required}) : super(key: key);

  @override
  State<BookStore> createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  String genrePage = 'All';
  int? genreId;
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _refreshPage() async {
    print('refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        color: Palette.primary,
        backgroundColor: Palette.white,
        key: _refreshIndicatorKey,
        onRefresh: _refreshPage,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Bookstore',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: switchButtons(),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.8,
                    child: chipSwitch(genrePage, genreId),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chipSwitch(String genrePage, genreId) {
    return genrePage != 'All'
        ? BookPage(
            genre: genrePage,
            genreId: genreId,
          )
        : const AllPage();
  }

  Widget switchButtons() {
    return Row(
      children: [
        GenreButton(
          onTap: () => updateGenre('All', 0),
          text: 'All',
          bcolor: genrePage == 'All' ? Palette.primary : Colors.transparent,
          brcolor: genrePage == 'All' ? Colors.transparent : Palette.grey,
          textcolor: genrePage == 'All' ? Colors.white : Palette.grey,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              final genre = genres[index].genre;
              final id = genres[index].id;
              return GenreButton(
                onTap: () {
                  setState(() {
                    updateGenre(
                      genre,
                      id,
                    );
                  });
                },
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

  void updateGenre(String genre, int id) {
    setState(() {
      genrePage = genre;
      genreId = id;
    });
  }
}

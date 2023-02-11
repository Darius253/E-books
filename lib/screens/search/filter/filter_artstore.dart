import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class FilterArtStore extends StatefulWidget {
  final String searchword;
  const FilterArtStore({super.key, required this.searchword});

  @override
  State<FilterArtStore> createState() => _FilterArtStoreState();
}

class _FilterArtStoreState extends State<FilterArtStore> {
  List<BookInfoData> filteredResults = [];
  @override
  void initState() {
    super.initState();
    filteredResults = infodata
        .where((result) => result.title
            .toLowerCase()
            .contains(widget.searchword.toLowerCase()))
        .toList();
  }

  String filterType = 'art';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
         height: height,
        child: GridView.builder(
          itemCount: filteredResults.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      filteredResults[index].image,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      filteredResults[index].author,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Palette.black,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        filteredResults[index].title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Palette.grey,
                        ),
                      ),
                    ),
                    Text(
                      filteredResults[index].price,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: Palette.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

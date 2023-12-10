import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/search/filter_page.dart';
import 'package:reader_app/shared/exports.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin<SearchPage> {
  @override
  bool get wantKeepAlive => true;
  final _controlller = TextEditingController();
  String? search;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: SearchField(
            controller: _controlller,
            onSearch: (value) {
              setState(() {
                search = value;
              });
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: search != null
                ? FilterPage(
                    search: search,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text(
                        'Browse Tags',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.75,
                        child: const SearchTags(),
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

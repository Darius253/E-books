import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:reader_app/shared/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  bool bookshelf = true;
   final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  bool get wantKeepAlive => true;


Future<void> _refreshPage() async {
    print('refreshing');
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:  LiquidPullToRefresh(
          color: Palette.primary,
          backgroundColor: Palette.white,
                            key: _refreshIndicatorKey, // key if you want to add
                            onRefresh: _refreshPage,
          child: CustomScrollView(
              slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: height * 0.05,
            flexibleSpace: FlexibleSpaceBar(
              title: appBar(width, height),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.05),
            child: bookshelf ? const BookShelf() : const ArtGallery(),
          )),
              ],
            ),
        ));
  }

  //APPBar
  Widget appBar(double height, double width) {
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('Bookshelf');
                  setState(() {
                    bookshelf = true;
                  });
                },
                child: Text(
                  'Bookshelf',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: bookshelf
                          ? const Color.fromARGB(255, 237, 112, 23)
                          : Colors.grey),
                ),
              ),
              Container(
                  width: width * 0.1,
                  height: height * 0.005,
                  color: bookshelf
                      ? const Color.fromARGB(255, 237, 112, 23)
                      : Colors.transparent)
            ],
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            color: Colors.grey,
            width: width * 0.003,
            height: height * 0.05,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    print('Art Gallery');
                    setState(() {
                      bookshelf = false;
                    });
                  },
                  child: Text(
                    'Art Gallery',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: !bookshelf
                            ? const Color.fromARGB(255, 237, 112, 23)
                            : Colors.grey),
                  )),
              Container(
                  width: width * 0.1,
                  height: height * 0.005,
                  color: !bookshelf
                      ? const Color.fromARGB(255, 237, 112, 23)
                      : Colors.transparent)
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {
                Get.to(const ProfilePage());
              },
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 41, 45, 50),
              ))
        ],
      ),
    );
  }
}

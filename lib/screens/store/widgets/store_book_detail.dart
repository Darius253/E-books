import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class StoreBookDetail extends StatefulWidget {
  const StoreBookDetail({Key? key}) : super(key: key);

  @override
  State<StoreBookDetail> createState() => _StoreBookDetailState();
}

class _StoreBookDetailState extends State<StoreBookDetail> {
  final bookInfoItems = const [
    BookInfoItem(title: 'Genre', subtitle: 'Non-Fiction'),
    BookInfoItem(title: 'Released', subtitle: '1934'),
    BookInfoItem(title: 'Language', subtitle: 'EN'),
    BookInfoItem(title: 'Length', subtitle: '644'),
    BookInfoItem(title: 'Size', subtitle: '409.4 KB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            backgroundColor: Colors.transparent,
            expandedHeight: Get.height * 0.45,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                CupertinoIcons.back,
                color: Palette.black,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Container(
                width: Get.width,
                height: Get.height * 0.45,
                color: Palette.primary.withOpacity(0.2),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: Doubles.bodyMargin,
              ),
              children: [
                const SizedBox(height: 40.0),
                const Center(
                  child: Text(
                    'Death an inside story',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Palette.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Text(
                    'Sadhguru',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Palette.black40,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: 5.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Palette.black80,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                  child: ReadMoreText(
                    lorem,
                    trimLines: 5,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Palette.black40,
                    ),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less',
                    colorClickableText: Colors.black,
                    moreStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SeparatedRow(
                      separatorBuilder: () {
                        return Container(
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const VerticalDivider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        );
                      },
                      children: List.generate(bookInfoItems.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 40.0 : 0,
                            right: index == bookInfoItems.length - 1 ? 40.0 : 0,
                          ),
                          child: bookInfoItems[index],
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

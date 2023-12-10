import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/upload_artwork.dart';
import 'package:reader_app/screens/creator_dashboards/upload_book.dart';
import 'package:reader_app/shared/exports.dart';

enum ContentType {
  book,
  art,
}

class CreatorProfile extends StatefulWidget {
  const CreatorProfile({super.key});

  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  String? content;
  ContentType? contentType;
  int currrentpage = 0;
  String? name;
  String? accountType;
  String? token;
  final pageController = PageController();
  int number = 10;

  @override
  void initState() {
    super.initState();
    Person? person = boxPersons.get('personDetails');
    setState(() {
      name = person!.name;
      accountType = person.accountType;
      number = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> pages = [
      const AuthorCollections(),
      wallet(width, height),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          //   child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Container(
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://picsum.photos/id/$number/200/300"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      name!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.14,
                      ),
                    ),
                    subtitle: Text(
                      accountType!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.10,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () => Get.to(() => const ProfilePage(
                            accountType: 'creator',
                          )),
                      child: PhosphorIcon(PhosphorIcons.regular.gearSix),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          PhosphorIcons.regular.mapPin,
                          color: const Color.fromARGB(255, 41, 45, 50)
                              .withOpacity(0.6),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Earth',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.10,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currrentpage = 0;
                          });
                          pageController.jumpToPage(0);
                        },
                        child: Column(
                          children: [
                            Text(
                              'My Collections',
                              style: TextStyle(
                                color: currrentpage == 0
                                    ? const Color(0xFFED7117)
                                    : Colors.grey,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            currrentpage == 0
                                ? Container(
                                    width: width * 0.25,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFED7117),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.50,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0xFFED7117),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: height * 0.035,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.75,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFA5A5A5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currrentpage = 1;
                          });
                          pageController.jumpToPage(1);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Wallet',
                              style: TextStyle(
                                color: currrentpage == 1
                                    ? const Color(0xFFED7117)
                                    : Colors.grey,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            currrentpage == 1
                                ? Container(
                                    width: width * 0.25,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFED7117),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.50,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0xFFED7117),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: pages,
                      onPageChanged: (value) {
                        setState(() {
                          currrentpage = value;
                        });
                      },
                    ),
                  ))
                ],
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 70,
                child: currrentpage == 0
                    ? InkWell(
                        onTap: () => selectContent(),
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.075,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: const Color(0xFFED7117),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PhosphorIcon(
                                PhosphorIcons.regular.plusCircle,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Upload Content',
                                style: TextStyle(
                                  color: Color(0xFFFEFAF6),
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.075,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: const Color(0xFFED7117),
                          ),
                          child: const Center(
                            child: Text(
                              'Request Payment',
                              style: TextStyle(
                                color: Color(0xFFFEFAF6),
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
              )
           
            ],
          ),
        ));
  }

  Future<void> selectContent() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (
          context,
        ) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: PhosphorIcon(
                      PhosphorIcons.bold.x,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),
              AlertDialog.adaptive(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text(
                  'Select Content',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                content:
                    StatefulBuilder(builder: (context, StateSetter setState) {
                  return SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        radio('Book', ContentType.book, setState),
                        radio('Art', ContentType.art, setState),
                      ],
                    ),
                  );
                }),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Proceed',
                      style: TextStyle(color: Palette.primary),
                    ),
                    onPressed: () {
                      Get.back();
                      content == 'Book'
                          ? Get.to(() => const UploadBook())
                          : Get.to(() => const UploadArtWork());
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  Row radio(title, ContentType contents, Function setState) {
    return Row(children: [
      Transform.scale(
        scale: 1.8,
        child: Radio<ContentType>.adaptive(
          activeColor: Palette.primary,
          value: contents,
          groupValue: contentType,
          onChanged: (ContentType? value) {
            setState(() {
              contentType = value;
              content = title;
            });
          },
        ),
      ),
      Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black87),
      ),
    ]);
  }
}

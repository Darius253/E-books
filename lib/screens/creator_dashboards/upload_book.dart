import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/widgets.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UploadBook extends StatefulWidget {
  final String? bookCover;
  final String? selectedDate;
  final String? description;
  final String? title;
  final String? pseudonym;
  final String? pages;
  final String? price;
  final String? isbn;
  final String? edition;
  final String? language;
  final String? book;
  final List<String>? selectedGenres;
  const UploadBook({
    super.key,
    this.book,
    this.bookCover,
    this.description,
    this.edition,
    this.isbn,
    this.language,
    this.pages,
    this.price,
    this.pseudonym,
    this.selectedDate,
    this.title,
    this.selectedGenres,
  });

  @override
  State<UploadBook> createState() => _UploadBookState();
}

class _UploadBookState extends State<UploadBook> {
  List<Genre> selectedGenres = [];
  File? bookCover;
  String selectedDate = '';
  String description = '';
  String title = '';
  String pseudonym = '';
  String pages = '';
  String price = '';
  String isbn = '';
  String edition = '';
  String language = '';
  PlatformFile? book;
  bool checked = false;

  final DateRangePickerController controller = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            appBar(width, height, '', false),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title != null ? 'Edit Book' : 'Upload Book',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.48,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const PhosphorIcon(
                        PhosphorIconsRegular.trash,
                        color: Colors.red,
                      ),
                      InkWell(
                        onTap: () {
                          showAdaptiveDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          height:
                                              MediaQuery.sizeOf(context).width *
                                                  0.1,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const PhosphorIcon(
                                            PhosphorIconsBold.x,
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
                                        'Delete Book',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      content: const Text(
                                          'Are you sure you want to delete this Book?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          'Delete Book',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () => selectBookCover(),
                      child: widget.bookCover != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: width,
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: widget.bookCover!,
                                        width: width,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 10, sigmaX: 10),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              40, 53, 51, 51),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: CachedNetworkImage(
                                              imageUrl: widget.bookCover!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: width,
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: bookCover != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Stack(
                                          children: [
                                            Image.file(
                                              bookCover!,
                                              width: width,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaY: 10, sigmaX: 10),
                                              child: Container(
                                                color: const Color.fromARGB(
                                                    40, 53, 51, 51),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Image.file(bookCover!),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                                vertical: height * 0.05),
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            PhosphorIcon(
                                              PhosphorIconsRegular.image,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              'Upload Book Cover',
                                              style: TextStyle(
                                                color: Color(0xFF222222),
                                                fontSize: 20,
                                                fontFamily: 'Epilogue',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'PNG,JPEG, JPG',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            )),
                  const SizedBox(
                    height: 40,
                  ),
                  textField(height, 'TITLE ', 'Required', widget.title,
                      (value) {
                    setState(() {
                      title = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'PSEUDONYM ', '', widget.pseudonym,
                      (value) {
                    setState(() {
                      pseudonym = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'EDITION ', 'Required', widget.edition,
                      (value) {
                    setState(() {
                      edition = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'ISBN ', 'Required', widget.isbn ?? '',
                      (value) {
                    setState(() {
                      isbn = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(
                      height, 'LANGUAGE ', '', widget.language ?? "English",
                      (value) {
                    setState(() {
                      language = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'PRICE ', '(GHS)', widget.price, (value) {
                    setState(() {
                      price = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  tags(width, height, 'GENRES', () {
                    chooseGenre(height, width);
                  },
                      ListView.builder(
                          itemCount: selectedGenres.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 7.0, bottom: 7, left: 7, right: 10),
                              child: relatedGenres(selectedGenres[index].text),
                            );
                          })),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(
                      height, 'NUMBER OF PAGES ', 'Required', widget.pages,
                      (value) {
                    setState(() {
                      pages = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  tags(
                    width,
                    height * 5,
                    'PUBLICATION DATE',
                    () {},
                    SfDateRangePicker(
                      todayHighlightColor: Palette.primary,
                      controller: controller,
                      showNavigationArrow: true,
                      initialDisplayDate: widget.selectedDate != null
                          ? DateTime.parse(widget.selectedDate!)
                          : DateTime.now(),
                      selectionColor: Palette.primary,
                      onSelectionChanged: onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.single,
                      initialSelectedDate: selectedDate.isNotEmpty
                          ? DateTime.parse(selectedDate)
                          : widget.selectedDate != null
                              ? DateTime.parse(widget.selectedDate!)
                              : DateTime.now(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  descriptiontextField(
                      height, 'DESCRIPTION ', 'Required', widget.description,
                      (value) {
                    setState(() {
                      description = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => selectBook(),
                    child: SizedBox(
                      width: width,
                      height: height * 0.07,
                      child: CustomPaint(
                        painter: DottedBorderPainter(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PhosphorIcon(PhosphorIconsRegular.fileDoc,
                                color: Colors.black),
                            book != null
                                ? Text(
                                    book!.name,
                                    style: const TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 20,
                                      fontFamily: 'Epilogue',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : const Text(
                                    'Select Book',
                                    style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 20,
                                      fontFamily: 'Epilogue',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Checkbox.adaptive(
                          activeColor: const Color.fromARGB(255, 0, 123, 64),
                          value: checked,
                          onChanged: (value) {
                            setState(() {
                              checked = value!;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'I acknowledge this is my own original work',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (title.isNotEmpty &&
                      pseudonym.isNotEmpty &&
                      edition.isNotEmpty &&
                      isbn.isNotEmpty &&
                      language.isNotEmpty &&
                      price.isNotEmpty &&
                      selectedGenres.isNotEmpty &&
                      pages.isNotEmpty &&
                      selectedDate.isNotEmpty &&
                      description.isNotEmpty &&
                      book != null &&
                      checked)
                    Center(
                      child: InkWell(
                        onTap: () {
                          print('Uploading.....');
                          print(title);
                          print(pseudonym);
                          print(edition);
                          print(isbn);
                          print(language);
                          print(price);
                          print(selectedGenres);
                          print(pages);
                          print(selectedDate);
                          print(description);
                          print(book!.name);
                          print(checked);
                        },
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.075,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: const Color(0xFFED7117),
                          ),
                          child: const Center(
                              child: Text(
                            'Upload Book',
                            style: TextStyle(
                              color: Color(0xFFFEFAF6),
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void chooseGenre(
    double height,
    double width,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SizedBox(
              height: height * 0.5,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30),
                itemCount: genres.length,
                itemBuilder: (context, index) => RelatedGenres(
                  genre: genres[index].text,
                  onSelect: (isSelected) {
                    setState(() {
                      genres[index].isSelected = isSelected;
                      if (isSelected && selectedGenres.length < 4) {
                        selectedGenres.add(genres[index]);
                      } else {
                        selectedGenres.remove(genres[index]);
                      }
                    });
                    // onGenresSelected(selectedGenres);
                  },
                  genres: genres[index],
                ),
              ),
            ),
          );
        });
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        selectedDate = args.value.toString();
      }
    });
    print(selectedDate);
  }

  Future selectBookCover() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      onFileLoading: (p0) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        bookCover = file;
      });
      return bookCover;
    } else {
      Get.snackbar('Image Selection', 'No image was selected');
    }
  }

  Future selectBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      onFileLoading: (p0) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
    if (result != null) {
      PlatformFile file = result.files.single;
      setState(() {
        book = file;
      });
      Get.snackbar('Book Selection', 'Book has been selected',
          snackPosition: SnackPosition.BOTTOM);
      return book;
    } else {
      Get.snackbar('Book Selection', 'No book was selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

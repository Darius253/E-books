import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/widgets.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UploadArtWork extends StatefulWidget {
  const UploadArtWork({
    super.key,
  });

  @override
  State<UploadArtWork> createState() => _UploadArtWorkState();
}

class _UploadArtWorkState extends State<UploadArtWork> {
  String selectedDate = '';
  String about = '';
  String title = '';
  String medium = '';
  String materials = '';
  String price = '';
  String size = '';
  String certificate = 'Included';
  String rarity = '';
  File? artwork;
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
                  const Text(
                    'Upload Artwork',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.48,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => selectArt(),
                      child: Container(
                        width: width * 0.5,
                        height: height * 0.25,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFD9D9D9)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: artwork != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  artwork!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    vertical: height * 0.075),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PhosphorIcon(
                                      PhosphorIcons.regular.plusCircle,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Upload Image',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  textField(height, 'TITLE ', 'Required', title, (value) {
                    setState(() {
                      title = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'MEDIUM ', '', medium, (value) {
                    setState(() {
                      medium = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'MATERIALS ', '', materials, (value) {
                    setState(() {
                      materials = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'RARITY ', '', rarity, (value) {
                    setState(() {
                      rarity = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'SIZE ', 'Required', size, (value) {
                    setState(() {
                      size = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(
                      height, 'CERTIFICATE OF AUTHENTICITY ', 'Required', certificate,
                      (value) {
                    setState(() {
                      certificate = value;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  textField(height, 'PRICE ', '(GHS)', price, (value) {
                    setState(() {
                      price = value;
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
                      selectionColor: Palette.primary,
                      onSelectionChanged: onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.single,
                      initialSelectedDate: selectedDate.isNotEmpty
                          ? DateTime.parse(selectedDate)
                          : DateTime.now(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  descriptiontextField(height, 'ABOUT ', 'Required', about,
                      (value) {
                    setState(() {
                      about = value;
                    });
                  }),
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
                      medium.isNotEmpty &&
                      materials.isNotEmpty &&
                      rarity.isNotEmpty &&
                      price.isNotEmpty &&
                      selectedDate.isNotEmpty &&
                      about.isNotEmpty &&
                      artwork != null &&
                      checked)
                    Center(
                      child: InkWell(
                        onTap: () {
                          print('Uploading.....');
                          print(title);
                          print(medium);
                          print(materials);
                          print(price);
                          print(rarity);
                          print(selectedDate);
                          print(about);
                          print(artwork!);
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
                            'Upload Art',
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

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        selectedDate = args.value.toString();
      }
    });
    print(selectedDate);
  }

  Future selectArt() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      onFileLoading: (p0) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        artwork = file;
      });
      return bookCover;
    } else {
      Get.snackbar('Image Selection', 'No image was selected');
    }
  }
}

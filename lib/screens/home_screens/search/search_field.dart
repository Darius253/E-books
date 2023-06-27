import 'package:flutter/material.dart';

import 'package:reader_app/shared/constants.dart';

import '../../../shared/exports.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController();
  String? search;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.044),
      color: Palette.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.044),
        child: Container(
          width: width * 0.8,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.016,
            ),
            child: Center(
              child: ListTile(
                horizontalTitleGap: 8,
                minLeadingWidth: 8,
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PhosphorIcon(
                    PhosphorIcons.regular.magnifyingGlass,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title, author or artist',
                      hintStyle: TextStyle(
                        color:  Colors.grey.withOpacity(0.6),
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        search = value;
                      });
                    },
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PhosphorIcon(PhosphorIcons.regular.funnelSimple),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

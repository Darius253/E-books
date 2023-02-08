import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreChips extends StatelessWidget {
  const GenreChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Palette.primary,
              backgroundColor: Colors.transparent,
              label: Text('All')),
              SizedBox(width: 5,),
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text("Comedy")),
          SizedBox(
            width: 5,
          ),
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Fiction')),
          SizedBox(
            width: 5,
          ),
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Non-Fiction')),
          SizedBox(
            width: 5,
          ),
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Mystery')),
          SizedBox(
            width: 5,
          ),
          Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Adventure')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Romance')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Poetry')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Acts')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Science')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Sports')),
          SizedBox(
            width: 5,
          ),
              Chip(
              padding: EdgeInsets.all(8),
              side: BorderSide(color: Palette.grey),
              shadowColor: Colors.blue,
              backgroundColor: Colors.transparent,
              label: Text('Crime')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FictionPage extends StatefulWidget {
  const FictionPage({super.key});

  @override
  State<FictionPage> createState() => _FictionPageState();
}

class _FictionPageState extends State<FictionPage> {
  String genrePage = 'fiction';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
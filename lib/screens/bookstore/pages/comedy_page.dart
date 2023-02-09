
import 'package:flutter/material.dart';

class ComedyPage extends StatefulWidget {
  const ComedyPage({super.key});

  @override
  State<ComedyPage> createState() => _ComedyPageState();
}

class _ComedyPageState extends State<ComedyPage> {
  String genrePage = 'comedy';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
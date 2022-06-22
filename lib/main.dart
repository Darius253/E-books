import 'package:flutter/material.dart';
import 'package:reader_app/shared.dart/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReaderApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const App(),
    );
  }
}

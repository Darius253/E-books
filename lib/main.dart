import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:reader_app/shared/exports.dart';

void main() => runApp(const App());
=======
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
      title: 'AwStore',
      theme: ThemeData(
        fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
        primaryColor: const Color.fromARGB(242, 237, 112, 23),
        primarySwatch: Colors.orange,
      ),
      home: const App(),
    );
  }
}
>>>>>>> master

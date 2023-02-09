import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reader_app/screens/bookstore/header_part.dart';
import 'package:reader_app/shared/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return GetCupertinoApp(
      title: 'AwStore',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: HeaderPart(),
    );
  }
}

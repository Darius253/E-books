import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      localizationsDelegates: const <LocalizationsDelegate>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home:HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reader_app/shared/exports.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const GetCupertinoApp(
      title: 'AwStore',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      // theme: ThemeData(
      //   fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
      //   primaryColor: const Color.fromARGB(242, 237, 112, 23),
      //   primarySwatch: Colors.orange,
      // ),
      // home: const OnBoardingScreen(),
      home: SelectSignUp(),
    );
  }
}

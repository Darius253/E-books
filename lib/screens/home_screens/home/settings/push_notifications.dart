import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/widgets/widgets.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  bool pushOn = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(width, height, 'Push Notifications', false),
            Container(
              color: const  Color(0xFFFEFAF6),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: ListTile(
                    leading: const Text(
                      'Push Notifications',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // const Expanded(child: SizedBox()),
                    trailing: Switch.adaptive(
                        applyCupertinoTheme: true,
                        activeTrackColor: const Color.fromARGB(255, 0, 128, 0),
                        activeColor: Colors.white,
                        value: pushOn,
                        onChanged: (value) {
                          setState(() {
                            pushOn = value;
                          });
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/home/settings/account_details.dart';
import 'package:reader_app/screens/home_screens/home/settings/fav_genre.dart';
import 'package:reader_app/screens/home_screens/home/settings/push_notifications.dart';
import 'package:reader_app/shared/exports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userId = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBar(width, height, 'Settings', false),
              header(width),
              SizedBox(height: height * 0.05),
              contents(width),
              SizedBox(height: height * 0.05),
              contents2(width),
              SizedBox(height: height * 0.05),
              logOut(width)
            ],
          ),
        ),
      ),
    );
  }

  Widget header(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFAF6),
        ),
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 217, 217, 217),
              child: Center(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: width * 0.1,
                  color: const Color.fromARGB(255, 41, 45, 50),
                ),
              )),
          title: const Text(
            'Darius Tron',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            'trondarius@gmail.com',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }

  Widget contents(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFAF6),
        ),
        child: Column(
          children: [
            iconsText(PhosphorIcons.regular.user, 'Settings', width,
                () => Get.to(() => AccountDetails(id: userId))),
            iconsText(Icons.delivery_dining_outlined, 'Order History', width,
                () => Get.to(() => const OrderHistory())),
            iconsText(
              Icons.notifications_none_outlined,
              'Push Notification',
              width,
              () => Get.to((const PushNotification())),
            ),
            iconsText(
              PhosphorIcons.regular.sparkle,
              'Favourite Genre',
              width,
              () => Get.to(() => const FavouriteGenre()),
            ),
          ],
        ));
  }

  Widget contents2(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFAF6),
        ),
        child: Column(
          children: [
            iconsText(
                Icons.privacy_tip_outlined, 'Privacy Policy', width, () {}),
            iconsText(Icons.flag_outlined, 'Report Content', width, () {}),
            iconsText(Icons.assignment_late_outlined, 'Terms and Conditions',
                width, () {}),
          ],
        ));
  }

  Widget logOut(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child:
            iconsText(PhosphorIcons.regular.signOut, 'Log Out', width, () {}));
  }

  Widget iconsText(
      IconData leading, String text, double width, Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: Icon(
          leading,
          size: width * 0.085,
          color: const Color.fromARGB(255, 237, 112, 23),
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: width * 0.04,
        ),
      ),
    );
  }
}

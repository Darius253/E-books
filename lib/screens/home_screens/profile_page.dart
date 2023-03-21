import 'package:flutter/material.dart';
import '../../shared/exports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
        color: Colors.white,
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
        trailing: InkWell(
          onTap: () => Get.off(const HomePage()),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: width * 0.05,
          ),
        ),
      ),
    );
  }

  Widget contents(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            iconsText(Icons.delivery_dining_outlined, 'Order History', width),
            iconsText(Icons.settings_outlined, 'Settings', width),
            iconsText(
                Icons.notifications_none_outlined, 'Push Notification', width),
          ],
        ));
  }

  Widget contents2(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            iconsText(Icons.privacy_tip_outlined, 'Privacy Policy', width),
            iconsText(Icons.settings_outlined, 'Settings', width),
            iconsText(Icons.flag_outlined, 'Report Content', width),
            iconsText(
                Icons.assignment_late_outlined, 'Terms and Conditions', width),
          ],
        ));
  }

  Widget logOut(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: iconsText(Icons.logout_outlined, 'Log Out', width));
  }

  Widget iconsText(IconData leading, String text, double width) {
    return ListTile(
      leading: Icon(
        leading,
        size: width * 0.085,
        color: const Color.fromARGB(255, 237, 112, 23),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      trailing: InkWell(
        onTap: () {},
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: width * 0.04,
        ),
      ),
    );
  }
}

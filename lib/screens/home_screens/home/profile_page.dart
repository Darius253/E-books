import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final String? accountType;
  const ProfilePage({super.key, this.accountType});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String accountType = '';
  int? number;

  final Uri _url =
      Uri.parse('https://readerapp.godaddysites.com/privacy-policy');

  Future<void> _getUserDetails() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        username = person.name;
        accountType = person.accountType;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserDetails();
    number = Random().nextInt(100);
  }

  File? profilePicture;

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
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        decoration: const BoxDecoration(
          color: Color(0xFFFEFAF6),
        ),
        child: ListTile(
          leading: Container(
            width: width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                    "https://picsum.photos/id/$number/200/300"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            accountType.toUpperCase(),
            style: const TextStyle(
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
            iconsText(PhosphorIconsRegular.user, 'Settings', width,
                () => Get.to(() => const AccountDetails())),
            iconsText(Icons.delivery_dining_outlined, 'Order History', width,
                () => Get.to(() => const OrderHistory())),
            iconsText(
              Icons.notifications_none_outlined,
              'Push Notification',
              width,
              () => Get.to((const PushNotification())),
            ),
            iconsText(
              PhosphorIconsRegular.sparkle,
              'Favourite Genre',
              width,
              () => Get.to(() => const FavouriteGenre()),
            ),
            widget.accountType == 'creator'
                ? iconsText(
                    PhosphorIconsRegular.money,
                    'Payments',
                    width,
                    () => Get.to(() => const OrderHistory()),
                  )
                : const SizedBox.shrink(),
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
            iconsText(Icons.privacy_tip_outlined, 'Privacy Policy', width, () {
              _launchInWebViewWithoutJavaScript(_url);
            }),
            iconsText(Icons.flag_outlined, 'Report Content', width, () {}),
            iconsText(Icons.assignment_late_outlined, 'Terms and Conditions',
                width, () {}),
          ],
        ));
  }

  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget logOut(double width) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: iconsText(PhosphorIconsRegular.signOut, 'Log Out', width, () {
          logOutPop();
        }));
  }

  Future<void> clearUserData() async {
    final boxPersons = await Hive.openBox<Person>('userDetails');
    final boxGenres = await Hive.openBox<FavGenres>('favGenres');
    await boxPersons.clear();
    await boxGenres.clear();
  }

  Future<void> signOut() async {
    await clearUserData();
    Get.offAll(() => const SignIn());
  }

  logOutPop() {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.red),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to sign out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                signOut();
              },
            ),
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

  Future uploadProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      onFileLoading: (p0) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        profilePicture = file;
      });
      Get.snackbar('Please Wait', 'Updating profile picture ...',
          snackPosition: SnackPosition.BOTTOM);
      return profilePicture;
    } else {
      Get.snackbar('Image Selection', 'Cancelled',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

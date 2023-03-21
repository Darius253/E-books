import 'package:flutter/material.dart';
import '../../../shared/exports.dart';

class SelectGenre extends StatefulWidget {
  const SelectGenre({super.key});

  @override
  State<SelectGenre> createState() => _SelectGenreState();
}

class _SelectGenreState extends State<SelectGenre> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        const Text('Hello, Darius!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(235, 237, 112, 23),
                              fontSize: 16,
                            )),
                        const SizedBox(height: 8),
                        const Text(
                            'Please select 3 genres that you like to read. This will help us recommend books  based on your interests',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(251, 0, 0, 0))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.032),
                      ],
                    ),
                  ),
                  grid(width, height),
                  Button(
                    text: 'Next',
                    onTap: () => Get.to(const HomePage()),
                  )
                ],
              ))),
    );
  }
}

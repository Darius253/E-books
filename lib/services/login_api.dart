import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/models/boxes.dart';
import 'package:reader_app/models/person.dart';
import 'package:reader_app/screens/authenticate/new_user/genre.dart';
import 'package:reader_app/services/api_constants.dart';
import 'package:reader_app/shared/exports.dart';

class Login {
  Future<void> login(String email, String password) async {
    try {
      final dio = Dio();

      // Define the headers
      final headers = {
        'Access-Control-Allow-Origin': 'false',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json; charset=utf-8',
        'X-Content-Type-Options': 'nosniff',
        'X-Download-Options': 'noopen',
        'X-Frame-Options': 'DENY',
        'X-XSS-Protection': '1; mode=block',
      };

      // Set the headers in the Dio instance
      dio.options.headers = headers;

      final response = await dio.post(
        '$api$loginPath',
        data: {'email': email, 'password': password},
      );

      // Handle the response here
      if (response.statusCode == 200 && response.data['success'] == true) {
        boxPersons.put(
          'personDetails',
          Person(
              name: response.data['jwt']['name'],
              accountType: response.data['jwt']['account_type'],
              userId: response.data['jwt']['user_id']),
        );
        Get.to(() => const SelectGenre());
      } else {
        Get.snackbar(
          'Login Failed:',
          'Kindly provide the correct credentials',
          duration: const Duration(seconds: 5),
          colorText: Colors.red,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      print(error);
      Get.snackbar(
        'Login Failed:',
        'Something happened. Please Try again later.',
        duration: const Duration(seconds: 5),
        colorText: Colors.red,
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

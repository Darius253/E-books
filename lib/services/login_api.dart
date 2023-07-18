import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        print(response.data['jwt']['account_type']);
         print(response.data['jwt']['token']);

      
      } else {
        Get.snackbar(
          'Login Failed:',
          'Kindly check your details provided.',
          duration: const Duration(seconds: 5),
          colorText: Colors.red,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
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



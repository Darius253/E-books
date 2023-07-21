import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/models/boxes.dart';
import 'package:reader_app/models/person.dart';
import 'package:reader_app/services/api_constants.dart';
import 'package:reader_app/shared/exports.dart';

class SignUp {
  Future<void> customerSignUp(
    String username,
    String fullName,
    String email,
    String phoneNumber,
    String password,
  ) async {
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
      '$api$signupPath',
      data: {
        'email': email,
        'password': password,
        'username': username,
        'name': fullName,
        'mobile_money_number': phoneNumber,
        'account_type': 3,
      },
    );

    // Handle the response here
    try {
      if (response.statusCode == 200 && response.data['success'] == true) {
        print(response.data);
        boxPersons.put(
          'personDetails',
          Person(
              name: response.data['jwt']['name'],
              accountType: response.data['jwt']['account_type'],
              userId: response.data['jwt']['user_id']),
        );
      } else {
        Get.snackbar(
          'Account Creation Failed:',
          response.data['errors'][0]['detail'],
          duration: const Duration(seconds: 5),
          colorText: Colors.red,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error Creating Account:',
        response.data['errors'][0]['detail'],
        duration: const Duration(seconds: 5),
        colorText: Colors.red,
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> creatorSignup(
    String username,
    String fullName,
    String email,
    String phoneNumber,
    String password,
    int accountType,
  ) async {
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
      '$api$signupPath',
      data: {
        'email': email,
        'password': password,
        'username': username,
        'name': fullName,
        'mobile_money_number': phoneNumber,
        'account_type': accountType,
      },
    );

    // Handle the response here
    try {
      if (response.statusCode == 200 && response.data['success'] == true) {
        print(response.data);
        // print(response.data['jwt']['account_type']);
        // print(response.data['jwt']['token']);
      } else {
        Get.snackbar(
          'Account Creation Failed:',
          response.data['errors'][0]['detail'],
          duration: const Duration(seconds: 5),
          colorText: Colors.red,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error Creating Account:',
        response.data['errors'][0]['detail'],
        duration: const Duration(seconds: 5),
        colorText: Colors.red,
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

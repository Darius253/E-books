import 'package:dio/dio.dart';
import 'package:reader_app/services/api_constants.dart';

class Categories {
  

  Future<void> getCategories(String bearerToken) async {
    try {
      final dio = Dio();

      // Define the headers
      final headers = {
        'Authorization':'Bearer $bearerToken',
        'Access-Control-Allow-Origin': 'false',
        'content-length': '71',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json; charset=utf-8',
        'X-Content-Type-Options': 'nosniff',
        'X-Download-Options': 'noopen',
        'X-Frame-Options': 'DENY',
        'X-XSS-Protection': '1; mode=block',
      };

      // Set the headers in the Dio instance
      dio.options.headers = headers;

      final response = await dio.get(
        '$api$genrePath',
      );

      // Handle the response here
      if (response.statusCode == 200 && response.data['success'] == true) {
        
      
      } else {
       print(response.data);
        
      }
    } catch (error) {
      print(error);
      // Get.snackbar(
      //   'Login Failed:',
      //   'Something happened. Please Try again later.',
      //   duration: const Duration(seconds: 5),
      //   colorText: Colors.red,
      //   backgroundColor: Colors.black,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  }
}

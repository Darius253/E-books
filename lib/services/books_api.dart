import 'package:dio/dio.dart';
import 'package:reader_app/services/api_constants.dart';

class BooksApi {
  Future<void> getBooks(String bearerToken) async {
    try {
      final dio = Dio();

      // Define the headers
      final headers = {
        'Authorization': 'Bearer $bearerToken',
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
        '$api$booksPath',
      );

      // Handle the response here
      if (response.statusCode == 200 && response.data['data'] != null) {
        print(response.data);
      } else {
        print(response.data);
      }
    }  catch (error) {
  if (error is DioError) {
    print('DioError: ${error.response?.data}');
    print('Status Code: ${error.response?.statusCode}');
  } else {
    print('Unknown Error: $error');
  }
  // Show the error using Get.snackbar
  // ...
}

  }
}

import 'package:dio/dio.dart';
import 'package:reader_app/services/api_constants.dart';
import 'package:reader_app/shared/exports.dart';

class FavGenreBooks {
  Future<List<Book>> getfavBooks(
      String bearerToken, int genreIDs, String page) async {
    try {
      final dio = Dio();

      // Define the headers
      final headers = {
        'Authorization': 'Bearer $bearerToken',
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
        '$api$favGenreBooks/$genreIDs',
        data: {'page': page},
      );

      // Handle the response here
      if (response.statusCode == 200 && response.data['data'] != null) {
        List<Book> books = (response.data['data'] as List)
            .map((json) => Book.fromJson(json))
            .toList();

        return books;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception("Failed to fetch books");
    }
  }

  Future<int> getLastPage(String bearerToken, int genreIDs) async {
    try {
      final dio = Dio();

      final headers = {
        'Authorization': 'Bearer $bearerToken',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json; charset=utf-8',
        'X-Content-Type-Options': 'nosniff',
        'X-Download-Options': 'noopen',
        'X-Frame-Options': 'DENY',
        'X-XSS-Protection': '1; mode=block',
      };

      dio.options.headers = headers;

      final response = await dio.get('$api$favGenreBooks/$genreIDs');

      if (response.statusCode == 200 && response.data['lastPage'] != null) {
        
        int lastPage = (response.data['lastPage'] as int);

        return lastPage;
      } else {
        return 0;
      }
    } catch (error) {
      throw Exception("Failed to get last Page");
    }
  }
}

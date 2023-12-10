import 'package:dio/dio.dart';
import 'package:reader_app/services/api_constants.dart';
import 'package:reader_app/shared/exports.dart';

class AllBooks {
  Future<List<Book>> getBooks(String bearerToken, String currentPage) async {
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

      final response = await dio.get(
        '$api$booksPath',
        data: {
          'page': currentPage,
        },
      );

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

  Future<List<Book>> getPopularBooks(
      String bearerToken, String currentPage) async {
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

      final response = await dio.get(
        '$api$popularBooks',
        data: {
          'page': currentPage,
        },
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        response.data['data'];

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

  Future<int> getAllBooksLastPage(String bearerToken) async {
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

      final response = await dio.get('$api$booksPath');

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

  Future<int> getPopularBooksLastPage(String bearerToken) async {
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

      final response = await dio.get('$api$popularBooks');

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

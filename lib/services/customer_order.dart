
import 'package:dio/dio.dart';
import 'package:reader_app/models/orders.dart';
import 'package:reader_app/services/api_constants.dart';

class AllOrders {
  Future<List<Order>> getOrders(String bearerToken) async {
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

      final response = await dio.get('$api$ordersPath');

      if (response.statusCode == 200 && response.data != null) {
        print(response.data['orders'][0]['orderItems'][0]['file_url']);

        List<Order> orders = (response.data['orders'] as List)
            .map((json) => Order.fromJson(json))
            .toList();
        return orders;

      } else {
        return [];
      }
    } catch (error) {
      throw Exception("Failed to fetch orders");
    }
  }

 
}

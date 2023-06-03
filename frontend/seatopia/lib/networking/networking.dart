import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingService {
  static const String baseUrl =
      'https://ff83-106-209-179-35.ngrok-free.app/'; // Replace with your API base URL

  Future<dynamic> get(String path) async {
    final url = Uri.parse('$baseUrl$path');

    try {
      final response = await http.get(url);
      return _handleResponse(response);
    } catch (error) {
      print('Error during GET request: $error');
      throw error;
    }
  }

  Future<dynamic> post(String path, dynamic data) async {
    final url = Uri.parse('$baseUrl$path');

    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return _handleResponse(response);
    } catch (error) {
      print('Error during POST request: $error');
      throw error;
    }
  }

  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = json.decode(response.body);

    if (statusCode >= 200 && statusCode < 300) {
      // Successful response
      return responseBody;
    } else {
      // Error response
      print('Request failed with status code: $statusCode');
      print('Response: $responseBody');
      throw Exception('Request failed with status code: $statusCode');
    }
  }
}

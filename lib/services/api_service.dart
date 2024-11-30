import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dev.api.laaragroup.com";

  Future<List<dynamic>> fetchProperties() async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/stays/filtered'),
      headers: {'x-app-id': '3a2f3e5b-4a89-4fcb-a7e1-31421c7a6344'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch properties');
    }
  }

  Future<Map<String, dynamic>> fetchPropertyDetails(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/stays/$id'),
      headers: {'x-app-id': '3a2f3e5b-4a89-4fcb-a7e1-31421c7a6344'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch property details');
    }
  }
}

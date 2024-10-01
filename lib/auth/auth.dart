import 'package:dio/dio.dart';

class AuthHelper {
  static final AuthHelper _instance = AuthHelper._internal();
  factory AuthHelper() => _instance;
  final Dio _dio = Dio();

  AuthHelper._internal();

  // Base URL of the backend API
  final String baseUrl =
      'http://localhost:3000'; // Replace with your actual API base URL

  // Fetch council members from API
  Future<List<dynamic>> getCouncilMembers() async {
    try {
      final response = await _dio.get('$baseUrl/council_members');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load council members');
      }
    } catch (e) {
      print('Error fetching council members: $e');
      return [];
    }
  }

  // Fetch club details from API
  Future<List<dynamic>> getClubDetails() async {
    try {
      final response = await _dio.get('http://localhost:3000/v1/api/club/clubs');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load club details');
      }
    } catch (e) {
      print('Error fetching club details: $e');
      return [];
    }
  }
}

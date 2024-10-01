// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:leomd/models/clubs.dart';
import 'package:leomd/models/councilM.dart';

class AuthHelper {
  static final AuthHelper _instance = AuthHelper._internal();
  factory AuthHelper() => _instance;
  final Dio _dio = Dio();

  AuthHelper._internal();

  // Base URL of the backend API
  final String baseUrl = 'http://10.0.2.2:3000/v1/api'; // Replace with your actual API base URL

  // Fetch council members from API
Future<List<Council>> getCouncilMembers() async {
  try {
    final response = await _dio.get('$baseUrl/district/council');

    if (response.statusCode == 200) {
      // Assuming the API response has a 'councilDetails' field containing a list of council members
      final data = response.data;

      if (data != null && data['councilDetails'] != null) {
        // Map the data to a List<Council>
        return (data['councilDetails'] as List)
            .map((councilData) => Council.fromJson(councilData as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('No council details found');
      }
    } else {
      throw Exception('Failed to load council members with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching council members: $e');
    return [];
  }
}


  // Fetch club details from API
  Future<List<Club>> getClubDetails() async {
    try {
      final response = await _dio.get('$baseUrl/club/clubs'); // Updated to use baseUrl

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['clubDetails'] != null) {
          var clubDetails = data['clubDetails'];

          // If clubDetails is a list, map each item to a Club object
          if (clubDetails is List) {
            return clubDetails.map((clubData) {
              return Club.fromJson(clubData as Map<String, dynamic>);
            }).toList();
          } 
          // If clubDetails is a single map, wrap it in a list
          else if (clubDetails is Map<String, dynamic>) {
            return [Club.fromJson(clubDetails)];
          } else {
            throw Exception('Unexpected format for club details');
          }
        } else {
          throw Exception('No club details found');
        }
      } else {
        throw Exception('Failed to load club details with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching club details: $e');
      return [];
    }
  }
}

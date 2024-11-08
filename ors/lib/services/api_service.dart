// lib/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:ors/models/user.dart';

class ApiService {
  final String baseUrl = 'http://localhost:5000/api';
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<User?> authenticateUser(String loginId, String password) async {
    try {
      final response = await _dio.post(
        '/user/authenticate',
        data: {
          'loginId': loginId,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data['user']);
      } else {
        throw Exception('Failed to authenticate user: ${response.data}');
      }
    } catch (error) {
      throw Exception('Failed to authenticate user: $error');
    }
  }

  Future<bool> logout() async {
    try {
      final response = await _dio.post('/user/logout');
      return response.statusCode == 200;
    } catch (error) {
      throw Exception('Failed to logout: $error');
    }
  }

  Future<void> signup(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post(
        '/user/signup',
        data: userData,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to sign up: ${response.data}');
      }
    } catch (error) {
      throw Exception('Failed to sign up: $error');
    }
  }

// Additional functions for search, get user, etc.
}
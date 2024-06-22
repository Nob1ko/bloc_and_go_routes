import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:template_app_bloc/repositories/token_manager.dart';

class BaseRepository {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.env['BASE_URL'] ?? "";
  // final String _authTokenKey = dotenv.env['AUTH_TOKEN_KEY'] ?? "";
  final TokenManager _tokenManager = TokenManager();

  BaseRepository() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.interceptors.add(
       InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _tokenManager.getAccessToken();
          options.headers['Authorization'] =  'Bearer $token';;
          log('Request: ${options.method} ${options.path}');
          return handler.next(options); // continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          log('Response: ${response.statusCode} ${response.data}');
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          log('Error: ${e.response?.statusCode} ${e.message}');
          return handler.next(e); // continue
        },
      ),
    );
  }

  Future<Response> get({required String endpoint, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      throw Exception('Failed to GET data: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to POST data: $e');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to PUT data: $e');
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to DELETE data: $e');
    }
  }
}

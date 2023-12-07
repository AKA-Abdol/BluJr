import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:khorsand87/moduls/core/api/storage.dart';

class CoreApi {
  final _client = Client();

  Future<Response?> get(
    Uri url, {
    Map<String, String>? headers,
    String? insertedToken,
  }) async {
    print(Storage.instance.accessToken ?? 'empty');
    try {
      return await _client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          HttpHeaders.authorizationHeader: 'Bearer ${Storage.instance.accessToken!}',
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      if (e is HttpException) {
        // Handle HttpException
        print('HttpException: ${e.message}');
      } else {
        // Handle other types of exceptions
        print('Exception: $e');
      }
      return null;
    }
  }

  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      return await _client.post(
        url,
        body: jsonEncode(body), // Encode the body as JSON
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          HttpHeaders.authorizationHeader: 'Bearer ${Storage.instance.accessToken!}',
          ...headers ?? {},
        },
      );
    } catch (e) {
      if (e is HttpException) {
        // Handle HttpException
        print('HttpException: ${e.message}');
      } else {
        // Handle other types of exceptions
        print('Exception: $e');
      }
      return null;
    }
  }

  Future<Response?> put(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.put(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> patch(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.patch(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> delete(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.delete(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

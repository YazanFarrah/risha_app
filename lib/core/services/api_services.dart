import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:risha_app/config/api_paths.dart';
import 'package:risha_app/config/constants.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/core/utils/prints.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class RestApiService {
  static Future<Map<String, String>> getHeaders() async {
    final hive = Get.find<HiveServices>();
    final token = hive.getToken;
    final lang = hive.getLanguage;

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
      'lang': lang,
      'x-api-key': AppConstants.apiKey,
    };
  }

  static Future<http.Response> get(String path,
      [Map<String, dynamic> queryParams = const {}]) async {
    printWarning(path);
    final url = Uri.parse('${ApiPaths.baseUrl}$path')
        .replace(queryParameters: queryParams);
    final headers = await getHeaders();
    log("HEADERS: $headers");

    return retry(
      () => http.get(url, headers: headers).timeout(const Duration(seconds: 4)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );
  }

  static Future<http.Response> post(String path,
      [Object? requestBody,
      Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.parse('${ApiPaths.baseUrl}$path');
    final headers = await getHeaders();
    printRed("Headers: $headers");
    printWarning("full url: $url");

    return retry(
      () => http
          .post(url, headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 4)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );
  }

  static Future<http.Response> put(String path,
      [Object? requestBody,
      Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.parse('${ApiPaths.baseUrl}$path');
    final headers = await getHeaders();
    printWarning("full url: $url");

    return retry(
      () => http
          .put(url, headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 4)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );
  }

  static Future<http.Response> patch(String path,
      [Object? requestBody,
      Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.parse('${ApiPaths.baseUrl}$path');
    final headers = await getHeaders();
    printWarning("full url: $url");

    return retry(
      () => http
          .patch(url, headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 4)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );
  }

  static Future<http.Response> delete(String path,
      [Object? requestBody,
      Map<String, dynamic> queryParams = const {}]) async {
    final url = Uri.parse('${ApiPaths.baseUrl}$path');
    final headers = await getHeaders();
    printWarning("full url: $url");
    printRed(headers);

    return retry(
      () => http
          .delete(url, headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 4)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );
  }

  static Future<http.Response> multipartPost(
    String path, {
    Map<String, String> fields = const {},
    Map<String, String> queryParams = const {},
    File? file,
    String fileKey = 'file',
  }) async {
    final uri = Uri.parse('${ApiPaths.baseUrl}$path')
        .replace(queryParameters: queryParams);
    final headers = await getHeaders();

    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..fields.addAll(fields);

    // Add file if provided
    if (file != null) {
      final fileStream = http.ByteStream(file.openRead());
      final length = await file.length();
      final multipartFile = http.MultipartFile(
        fileKey, // Use provided file key
        fileStream,
        length,
        filename: file.path.split('/').last,
      );
      request.files.add(multipartFile);
    }

    printWarning("Multipart request to: $uri");
    printWarning("Fields: $fields");
    printRed("Headers: $headers");

    final streamedResponse = await retry(
      () => request.send().timeout(const Duration(seconds: 10)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 4,
    );

    return http.Response.fromStream(streamedResponse);
  }

}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:property_care/OwnerScreen/login_screen.dart';
import 'package:property_care/core/Utils/key.dart';
import 'package:property_care/core/Utils/showMessage.dart';

Dio createDio() {
  Dio dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final box = await Hive.openBox("userData");
        final token = box.get("token");

        options.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) "Authorization": "Bearer $token",
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          log("Token expired / Unauthenticated");

          final box = await Hive.openBox("userData");

          // Token remove
          await box.delete("token");
          showErrorSnackBar("Session expired. Please log in again.");
          // Login screen par bhejo
          navigatorKey.currentState?.pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );

          return handler.next(error);
        }
        String message = "Something went wrong";

        try {
          final responseData = error.response?.data;

          log("ERROR RESPONSE: $responseData");

          if (responseData is Map) {
            // --------------------------------
            // Case 1: Validation errors (Prioritized)
            // --------------------------------
            if (responseData['errors'] is Map) {
              final errors = responseData['errors'] as Map;
              if (errors.isNotEmpty) {
                final firstError = errors.values.first;
                if (firstError is List && firstError.isNotEmpty) {
                  message = firstError.first.toString();
                } else if (firstError != null) {
                  message = firstError.toString();
                }
              }
            }
            // --------------------------------
            // Case 2: Normal message fallback
            // --------------------------------
            else if (responseData['message'] != null) {
              message = responseData['message'].toString();
            }
          }
        } catch (e) {
          log("Error while parsing DioException message: $e");
        }

        log("FINAL API ERROR MESSAGE: $message");

        showErrorSnackBar(message);

        return handler.next(error);
      },
    ),
  );
  return dio;
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:intl/intl.dart';

class DioHelper {
  static const String baseUrl = "https://dashboard.eloroshop.com/eloroshopAppApi/v1/api";

  static const String logInUrl = '/login';
  static const String signUpUrl = '/register';
  static const String forgotPasswordUrl = '/forgot-password';
  static const String verifyOTPUrl = '/verify-otp';
  static const String resetPasswordUrl = '/reset-password';
  static const String getVendorsProfileUrl = '/profile';
  static const String getOptionGroupUrl = '/OptionGroups/Multi?productId=61';

  static Dio? _dio;

  // #### dio init #### //

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 10),
    ))
    ..httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    // _dio!.options.headers['Authorization'] =
    // 'Bearer $globalCachedUserToken';
  }

  // #### login #### //
  static Future<Response> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio!.post(
        logInUrl,
        data: {
          "email": email,
          "password": password,
          // "rememberMe": true
        },
      );

      // print('ressssssssssssssssssssssssssssspons: ${response}');

      // if (response.statusCode == 200) {
      //   // print('ressssssssssssssssssssssssssssspons: ${response}');
      // }
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  // #### signUp #### //
  static Future<Response> signUp({
    required String arabicName,
    required String englishName,
    required String mobile,
    required String? email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response =
          // email != null && email != ""?
          await _dio!.post(
        // post with email
        signUpUrl,
        data: {
          "name_ar": arabicName,
          "name_en": englishName,
          "email": email,
          "mobile": mobile,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      // : await _dio!.post(
      //     // post without emial
      //     signUpUrl,
      //     data: {
      //       "name": name,
      //       "mobile": mobile,
      //       "password": password,
      //     },
      //   );

      // print('ressssssssssssssssssssssssssssspons: $response');

      if (response.statusCode == 200) {}
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

// #### forgot password #### //
  static Future<Response> forgotPassword({required String email}) async {
    try {
      final response = await _dio!.post(
        forgotPasswordUrl, // Define your endpoint URL
        data: {
          "email": email,
        },
      );

      return response;
    } catch (e) {
      throw Exception('Failed to send forgot password request: $e');
    }
  }

  // #### genral dio getData #### //
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    // print(url);
    // _dio!.options.headers = {
    //'lang': lang,

    // #### //
    // 'Authorization': 'Bearer $token'

    // #### //

    // ?? CacheHelper.getData(key: "token"),
    //'Content-Type': 'application/json',
    // };
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print(_dio!.options.headers);
    return await _dio!.get(
      url,
      queryParameters: query,
    );
  }

  // #### genral dio posData #### //
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,

    // String lang = "en",
    //String? token,
  }) async {
    _dio!.options.headers = {
      // #### //

      // 'Authorization': 'Bearer $token',
      // #### //

      //'Accept': 'application/json',
    };
    // print('url->$url\n data->$data');
    try {
      return await _dio!.post(
        url,
        queryParameters: queryParameters,
        data: data,
      );
    } catch (e) {
      print('err: $e');
      return Response(requestOptions: RequestOptions());
    }
  }

  // #### genral dio putData #### //
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,
    String lang = "en",
    // String? token,
  }) async {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',

      // #### //

      // 'Authorization': 'Bearer $token'

      // #### //
    };
    print('data $data');

    // #### //

    // print('token ${token}');

    // #### //

    return await _dio!.put(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }

  // #### genral dio deleteData #### //
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String lang = "en",
    String? token,
  }) async {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    return await _dio!.delete(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }


// #### fetchOptions #### //
  static Future<Response> fetchOptions() async {
    try {
   
    final response = await _dio!.get(getOptionGroupUrl);
   print(response);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch options: $e');
    }
  }


}

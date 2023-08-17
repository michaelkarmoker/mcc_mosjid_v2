import 'dart:convert';
import 'dart:io';





import 'package:flutter/foundation.dart' as Foundation;

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';


class ApiClientOfHttp  extends HttpOverrides{
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  String? token;
  String? userId;
  Map<String, String>? _mainHeaders;

  ApiClientOfHttp({required this.appBaseUrl, required this.sharedPreferences}) {

    // timeout = Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN)??"";
    userId = sharedPreferences.getString(AppConstants.USERID)??"";
    print('Token: $token');

    _mainHeaders = {
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',

    };
  }
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

  void updateHeader(String? token) {
    _mainHeaders = {
      //'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',

    };
  }


  Future<Response> postData(String uri, dynamic body, {Map<String, dynamic>? query, String? contentType,
    Map<String, String>? headers, Function(dynamic)? decoder, Function(double)? uploadProgress,
  }) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
        print('====> GetX Body: $body');
        print('====> GetX Body: $body');
      }
      Response response = await post(Uri.parse(appBaseUrl+uri), body:body,headers: headers??_mainHeaders);

      if(Foundation.kDebugMode) {
        print('====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    }catch (e) {
      print(e.toString());
      return Response(e.toString(), 1);

    }
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, String? contentType,
    Map<String, String>? headers, Function(dynamic)? decoder,
  }) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
      }
      Response response = await get(Uri.parse(appBaseUrl+uri),headers: headers??_mainHeaders,);
      if(Foundation.kDebugMode) {
        print('====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      print(e.toString());
      return Response(e.toString(),1);
    }
  }


}
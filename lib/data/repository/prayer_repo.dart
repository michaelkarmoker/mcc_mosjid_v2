import 'dart:async';
import 'dart:convert';




import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qibla_finder/controller/auth_controller.dart';
import 'package:qibla_finder/data/model/response/PrayerTimeResponse.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/body/login_body.dart';
import '../model/body/signup_body.dart';

class PrayerRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  PrayerRepo({required this.apiClient, required this.sharedPreferences});

 /* Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTER_URI, signUpBody.toJson());
  }*/

  Future<Response> getPrayertime() async {
    String ask="mccsl_app_secret_key";
    final bytes = utf8.encode(ask);
    final base64ASK = base64.encode(bytes);

   // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});

    return await apiClient.getData(AppConstants.LOGIN_URI, query: {
      "event":AppConstants.PRAYER_TIME_URI,
      "key":base64ASK
    });
  }


  Future<bool> savePrayerTime(PrayerTimeResponse data) async {

    String user = jsonEncode(data);
    return await sharedPreferences.setString(AppConstants.PRAYER_TIME, user);
  }

  String? getPrayerOfflinePrayerTime() {
    return sharedPreferences.getString(AppConstants.PRAYER_TIME);
  }

}

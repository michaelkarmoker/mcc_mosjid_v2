import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart' as h;

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mccs_masjid/controller/auth_controller.dart';
import 'package:mccs_masjid/data/model/response/PrayerTimeResponse.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../api/api_client_http.dart';
import '../model/body/login_body.dart';
import '../model/body/signup_body.dart';
import '../model/request/PrayerTimeUpdateRequest.dart';

class PrayerRepo {
  final ApiClientOfHttp apiClient;
  final SharedPreferences sharedPreferences;
  PrayerRepo({required this.apiClient, required this.sharedPreferences});

 /* Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTER_URI, signUpBody.toJson());
  }*/

  Future<h.Response> getPrayertime() async {
    String ask="mccsl_app_secret_key";
    final bytes = utf8.encode(ask);
    final base64ASK = base64.encode(bytes);

   // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});

    return await apiClient.getData(AppConstants.END_URI+"event=${AppConstants.GET_PRAYER_TIME_URI}&key=${base64ASK}");
  }


  Future<bool> savePrayerTime(PrayerTimeResponse data) async {

    String user = jsonEncode(data);
    return await sharedPreferences.setString(AppConstants.PRAYER_TIME, user);
  }



  Future<h.Response> updatePrayerTime(PrayerTimeUpdateRequest data) async {

    String appToken=Get.find<AuthController>().getUserToken();

    return await apiClient.postData(AppConstants.END_URI+"event=${AppConstants.UPDATE_PRAYER_TIME_URI}&apps_token=${appToken}",jsonEncode(data.toJson()) /*query: {
      "event":AppConstants.UPDATE_PRAYER_TIME_URI,
      "apps_token":"TnpBNE1qQXlNdz09Lk1qQXlNeTB3T0Mwd09RPT0"
    }*/);
  }

  String? getPrayerOfflinePrayerTime() {
    return sharedPreferences.getString(AppConstants.PRAYER_TIME);
  }

}

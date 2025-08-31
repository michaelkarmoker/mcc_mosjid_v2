import 'dart:convert';
import 'dart:io';



import 'package:mccs_masjid/controller/auth_controller.dart';
import 'package:mccs_masjid/controller/home_controller.dart';
import 'package:mccs_masjid/controller/prayer_controller.dart';
import 'package:mccs_masjid/data/api/api_client.dart';
import 'package:mccs_masjid/data/repository/prayer_repo.dart';
import 'package:mccs_masjid/util/app_constants.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';


import 'package:shared_preferences/shared_preferences.dart';



import '../controller/compass_controller.dart';
import '../data/api/api_client_http.dart';
import '../data/repository/auth_repo.dart';




Future<void> init() async {


  final sharedPreferences = await SharedPreferences.getInstance();
   Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClientOfHttp(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //repo

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PrayerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CompassController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => PrayerController(prayerRepo: Get.find()));











  //controller

  Get.lazyPut(() => AuthController(authRepo: Get.find()));








}

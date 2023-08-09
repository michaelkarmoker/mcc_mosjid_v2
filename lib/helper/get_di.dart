import 'dart:convert';



import 'package:qibla_finder/controller/auth_controller.dart';
import 'package:qibla_finder/controller/home_controller.dart';
import 'package:qibla_finder/controller/prayer_controller.dart';
import 'package:qibla_finder/data/api/api_client.dart';
import 'package:qibla_finder/data/repository/prayer_repo.dart';
import 'package:qibla_finder/util/app_constants.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';


import 'package:shared_preferences/shared_preferences.dart';



import '../controller/compass_controller.dart';
import '../data/repository/auth_repo.dart';




Future<void> init() async {


  final sharedPreferences = await SharedPreferences.getInstance();
   Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //repo

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PrayerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CompassController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => PrayerController(prayerRepo: Get.find()));











  //controller

  Get.lazyPut(() => AuthController(authRepo: Get.find()));








}

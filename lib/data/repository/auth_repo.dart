import 'dart:async';
import 'dart:convert';




import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/body/login_body.dart';
import '../model/body/signup_body.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

 /* Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTER_URI, signUpBody.toJson());
  }*/

  Future<Response> login({required LoginRequestBody loginBody}) async {
  /*  String ask="mccsl_app_secret_key";
    final bytes = utf8.encode(ask);*/
    final base64ASK ="bWNjc2xfYXBwX3NlY3JldF9rZXk=";
   // print(base64ASK);
    /*final id = utf8.encode(loginBody.loginData![0].usersEmail!);
    final pass = utf8.encode(loginBody.loginData![0].usersPassword!);
     loginBody.loginData![0].usersEmail = base64.encode(id);
     loginBody.loginData![0].usersPassword = base64.encode(pass);*/
   // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    return await apiClient.postData(AppConstants.END_URI,loginBody.toJson(), query: {
      "ask":base64ASK
    });
  }






  // for  user token
  Future<bool> saveUserToken(String token) async {
     apiClient.token = token;

     apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> saveUserId(String id) async {


    return await sharedPreferences.setString(AppConstants.USERID, id);
  }


  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
  String getUserId() {
    return sharedPreferences.getString(AppConstants.USERID) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }



  // for  Remember Email
  Future<void> saveUserNameAndPassword(String userName,String password,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NAME, userName);


    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserType(  String type,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_TYPE, type);


    } catch (e) {
      throw e;
    }
  }
  String getUserType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE) ?? "";
  }
  Future<void> saveUserProfile(
      bool isStudent,
      String name,
      String email,
      String? phone,
      String? image,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_EMAIL, email);
      await sharedPreferences.setBool(AppConstants.IS_STUDENT, isStudent);
      await sharedPreferences.setString(AppConstants.USER_PHONE, phone??" ");
      await sharedPreferences.setString(AppConstants.USER_IMAGE, image??" ");
      await sharedPreferences.setString(AppConstants.USER_NAMEP, name);

    } catch (e) {
      throw e;
    }
  }
  bool? getIsStudent() {
    return sharedPreferences.getBool(AppConstants.IS_STUDENT);
  }
  String getUserName() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  String getUserPermission() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

//profile===
  String getUserFullName() {
    return sharedPreferences.getString(AppConstants.USER_NAMEP) ?? "";
  }
  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }
  String getUserMobile() {
    return sharedPreferences.getString(AppConstants.USER_PHONE) ?? "";
  }
  String getUserImage() {
    return sharedPreferences.getString(AppConstants.USER_IMAGE) ?? "";
  }

  Future<bool> clearUserSigningInfo() async {


    //await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    //await sharedPreferences.remove(AppConstants.USERID);
    //await sharedPreferences.remove(AppConstants.USER_NAME);
    return await sharedPreferences.remove(AppConstants.TOKEN);

  }

  Future<bool> clearUserNumberAndPassword() async {


    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_NAME);
  }
}

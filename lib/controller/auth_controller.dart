import 'dart:convert';
import 'dart:io';


import 'package:qibla_finder/data/model/body/login_body.dart';
import 'package:qibla_finder/view/base/custom_snackbar.dart';
import 'package:qibla_finder/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';




import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;


  AuthController({
    required this.authRepo,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController studentId = TextEditingController();
  TextEditingController mobile = TextEditingController();


  bool _isLoading = false;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  set isActiveRememberMe(bool value) {
    _isActiveRememberMe = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future<void> setuserName() async {

    String password = getUserPassword();
    passwordController.text = password;
  }

  Future<void> login(LoginBody loginBody) async {
    _isLoading = true;
    update();

    Response response = await authRepo.login(loginBody: loginBody);



    if (response.statusCode == 200) {
      var data= jsonDecode(response.body);

      if(data["statusCode"]==200){
        if(_isActiveRememberMe){
          await authRepo.saveUserNameAndPassword( loginBody.password!);
        }else{
          await authRepo.clearUserNumberAndPassword();
        }


        await authRepo.saveUserToken(data["apps_token"]);



        showCustomSnackBar("Login Successfully",isError: false);
        Get.offAll(HomeScreen());
      }else{
        showCustomSnackBar("Login Failed",isError: true);
      }



    } else {

      showCustomSnackBar("Something wrong with internet");

    }

    _isLoading = false;
    update();
  }



  void loginVerification() async {
   /* String _email = emailController.text.trim();*/
    String _password = passwordController.text.trim();

      /*if (_email.isEmpty) {
        showCustomSnackBar('Enter username');
      } else*/ if (_password.isEmpty) {
        showCustomSnackBar('Enter Your Auth ID');
      } else if (_password.length < 5) {
        showCustomSnackBar('The Auth ID must be at least 6 Characters');
      } else {
        login(LoginBody(password: _password));
      }

  }






  bool isLoggedIn() {

    return authRepo.isLoggedIn();
  }

  bool? getIsStudent() {

    return authRepo.getIsStudent();
  }
  String getUserPermission() {
    return authRepo.getUserName() ?? "";
  }
  String getUserId() {
    return authRepo.getUserId() ?? "";
  }
  void saveUserNameAndPassword(

    String password,
  ) {
    authRepo.saveUserNameAndPassword(password);
  }

  String getUserName() {
    return authRepo.getUserName() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }
//profile====

  String getUserFullName() {
    return authRepo.getUserFullName() ?? "";
  }
  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }
  String getUserMobile() {
    return authRepo.getUserMobile() ?? "";
  }
  String getUserImage() {
    return authRepo.getUserImage() ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }
  Future<bool> signOut() async {
    return authRepo.clearUserSigningInfo();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
/*  void saveUserProfile(
      String name,
      String email,
      String phone,
      String image,
      ) {
    authRepo.saveUserProfile(name,email,phone,image);
  }*/
  void saveUserType(
      String userType,
      ) {
    authRepo.saveUserType(userType);
  }

  String getUserType() {
    return authRepo.getUserType();
  }
}

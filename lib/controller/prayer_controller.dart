import 'dart:convert';
import 'dart:io';


import 'package:qibla_finder/data/model/body/login_body.dart';
import 'package:qibla_finder/data/model/response/PrayerTimeResponse.dart';
import 'package:qibla_finder/data/repository/prayer_repo.dart';
import 'package:qibla_finder/view/base/custom_snackbar.dart';
import 'package:qibla_finder/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';




import '../data/repository/auth_repo.dart';
import '../util/InternetCheck.dart';

class PrayerController extends GetxController implements GetxService {
  final PrayerRepo prayerRepo;
  List<Data> prayerTimeList=[];

  PrayerController({
    required this.prayerRepo,
  });




  bool _isLoading = false;
  bool get isLoading => _isLoading;





  Future<void> getPrayerTime(bool fullRefress) async {
    _isLoading = true;
    update();


    if(prayerTimeList.length>0&&!fullRefress){


    }else{

      if(await InternetCheck.checkUserConnection()){
        Response response = await prayerRepo.getPrayertime();
        if (response.statusCode == 200) {


          PrayerTimeResponse prayerTimeResponse=new PrayerTimeResponse.fromJson(jsonDecode(response.body));

          if(prayerTimeResponse.statusCode==200){
            prayerTimeResponse.data!.map((e) {
              prayerTimeList.add(e);
            }).toList();
            prayerRepo.savePrayerTime(prayerTimeResponse);


          }else{
            showCustomSnackBar("Not Found any Prayer Time",isError: true);
          }

        } else {

          showCustomSnackBar("Something wrong with internet");

        }
      }else{
        String? prayerTime=prayerRepo.getPrayerOfflinePrayerTime();
        if(prayerTime!=null){
          PrayerTimeResponse prayerTimeResponse=PrayerTimeResponse.fromJson(jsonDecode(prayerTime));
          prayerTimeResponse.data!.map((e){
            prayerTimeList.add(e);
          } ).toList();
        }

      }


    }




    _isLoading = false;
    update();
  }


}

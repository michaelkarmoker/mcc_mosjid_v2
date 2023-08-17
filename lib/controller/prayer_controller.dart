import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as h;
import 'package:mccs_masjid/data/model/body/login_body.dart';
import 'package:mccs_masjid/data/model/request/PrayerTimeUpdateRequest.dart';
import 'package:mccs_masjid/data/model/response/PrayerTimeResponse.dart';
import 'package:mccs_masjid/data/repository/prayer_repo.dart';
import 'package:mccs_masjid/view/base/custom_snackbar.dart';
import 'package:mccs_masjid/view/screen/home/home_screen.dart';
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
      prayerTimeList=[];
      if(await InternetCheck.checkUserConnection()){
        h.Response response = await prayerRepo.getPrayertime();
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

  Future<void> updatePrayerTime(PrayerTimeUpdateRequest data) async {
    _isLoading = true;
    update();




      if(await InternetCheck.checkUserConnection()){
        h.Response response = await prayerRepo.updatePrayerTime(data);
        if (response.statusCode == 200) {


          PrayerTimeResponse prayerTimeResponse=new PrayerTimeResponse.fromJson(jsonDecode(response.body));

          if(prayerTimeResponse.statusCode==200){

            showCustomSnackBar(jsonDecode(response.body)["successMsg"],isError: false);
            getPrayerTime(true);
          }else{
            showCustomSnackBar("Update failed",isError: true);
          }

        } else {

          showCustomSnackBar("Something wrong with internet");

        }
      }else{
       showCustomSnackBar("Please Connect Internet and try again");

      }







    _isLoading = false;
    update();
  }
}

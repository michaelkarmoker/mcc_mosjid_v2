import 'dart:convert';
import 'dart:io';


import 'package:qibla_finder/data/model/body/login_body.dart';
import 'package:qibla_finder/view/base/custom_snackbar.dart';
import 'package:qibla_finder/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geodart/geometries.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qibla_finder/view/screen/home/widgets/OurServiceWidgetList.dart';
import 'package:vibration/vibration.dart';




import '../data/model/body/SliderModel.dart';
import '../data/repository/auth_repo.dart';
import '../view/screen/home/widgets/KhudbaWidgetList.dart';

class HomeController extends GetxController implements GetxService {


  bool isLoading=true;
   bool hasPermission=false;
  Position? position=null;
  double bearing=0.0;
  bool  isVibration=false;
  String? locationAddress=null;
  List<SliderModel>? sliders=[];
  List<Khutbah>? khutbahList=[];
  List<Service>? serviceList=[];
  int currentIndex=0;

  Future<void> getSlider() async {

    sliders=[];

    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner1.jpg",isButton: true));
  ///  sliders!.add(new SliderModel(imageUrl:"assets/banner/banner2.jpg" ));
    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner3.jpg",isButton: true ));
    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner4.jpg",subImage: "assets/banner/banner4Sub.png",isButton: true  ));
    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner5.jpg" ,isButton: true));
    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner6.jpg",isButton: true ));
    sliders!.add(new SliderModel(imageUrl:"assets/banner/banner7.jpg" ,isButton: true));

  }


  Future<void> getKhutbaList() async {

    khutbahList=[];
   khutbahList!.add(new Khutbah("2023-07-07", "https://www.youtube.com/watch?v=ciAZqaGsG-U", "assets/image/khutbathumbnail.PNG"));
   khutbahList!.add(new Khutbah("2023-07-14", "https://www.youtube.com/watch?v=ciAZqaGsG-U", "assets/image/khutba_thumbnail2.PNG"));
   khutbahList!.add(new Khutbah("2023-07-21", "https://www.youtube.com/watch?v=ciAZqaGsG-U", "assets/image/khutbathumbnail3.PNG"));


  }

  Future<void> getServiceList() async {

    serviceList=[];

   serviceList?.add(new Service("Youth Development", "Basic faith, soft skill development for kids and youth, and professional development programs for youth.",
   "assets/service_icon/youth_development.png"
   ));
   serviceList?.add(new Service("Five Times Prayer", "Five times prayers on a daily basis",
       "assets/service_icon/five_time_prayer.png"
   ));
   serviceList?.add(new Service("Friday Prayer", "Congregation prayer on every Friday.",
       "assets/service_icon/friday_prayer.png"
   ));
   serviceList?.add(new Service("Ramadan Prayer", "Taraweeh prayer throughout the month of Ramadan with the completion of the Glorious Quran.",
       "assets/service_icon/romadan.png"
   ));
   serviceList?.add(new Service("EID Prayer", "Congregation prayer after the month of Ramadan.",
       "assets/service_icon/eid_prayer.png"
   ));
   serviceList?.add(new Service("Quran Classes", "Weekly Quran Classes.",
   "assets/service_icon/quran.png"
   ));


  }

  Future<void> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied) {
      showCustomSnackBar("You have to allow location permission to use your location");
    }else if(permission == LocationPermission.deniedForever) {
     // Get.dialog(PermissionDialog());
    }else {
      isVibration=await Vibration.hasVibrator()??false;
      await getBearing();
      getLocation();
    }
  }






Future<void> getBearing() async {
  isLoading=true;
  update();
  if(position==null){
    position=await Geolocator.getCurrentPosition();
    if(position!=null){

      LineString line = LineString([
        Coordinate(position!.latitude, position!.longitude),
        Coordinate(21.422487, 39.826206),
      ]);
      bearing=line.bearing;
      print( "bearing is${line}");
      print( "bearing is${line.bearing}");

    }
  }


  isLoading=false;
  update();
}
  Future<void> getLocation() async {


      if(position!=null){
        try{
          print("hii this address1");
        List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude!, position!.longitude!);
        if(placemarks!=null){
          print("hii this address2");
          locationAddress=placemarks[0].locality!+", "+placemarks[0].country!;
        }
          print("hii this address3");
      }catch(e){
      locationAddress=null;
    }
      }


    update();
  }
  void setCurrentIndex(int index, bool notify) {
    currentIndex = index;
    if(notify) {
      update();
    }
  }
}

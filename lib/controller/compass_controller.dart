import 'dart:convert';
import 'dart:io';


import 'package:mccs_masjid/data/model/body/login_body.dart';
import 'package:mccs_masjid/view/base/custom_snackbar.dart';
import 'package:mccs_masjid/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geodart/geometries.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';




import '../data/repository/auth_repo.dart';

class CompassController extends GetxController implements GetxService {


  bool isLoading=false;
   bool hasPermission=false;
  Position? position=null;
  double bearing=0.0;
  bool  isVibration=false;
  String? locationAddress=null;
  /*Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }*/
 /* Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {

            hasPermission = (value == PermissionStatus.granted);
           update();
        });
      }
    }
  }*/





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
      await getLocation();
    }
  }

Future<void> getBearing() async {
  /*isLoading=true;
  update();*/
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


  /*print("is loadin false================");
  isLoading=false;
  update();*/
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

}

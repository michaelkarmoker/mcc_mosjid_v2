

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccs_masjid/util/styles.dart';
import 'package:sizer/sizer.dart';


import '../../../controller/auth_controller.dart';
import '../../../util/images.dart';


Widget createDrawerHeader(BuildContext context) {
  return SizedBox(
    height: Get.height/3.2,
    child: DrawerHeader(

        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/drawer_bg.png"
              ),
              fit: BoxFit.fill
          ),
        ), child:Container(
      color: Colors.green.withOpacity(0.2),
      padding: EdgeInsets.only(left: 10,bottom: 5),
               alignment: Alignment.bottomLeft,
                   width: Get.width,
          
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height:Get.height/9,),
             Image.asset("assets/image/logo.png",height: 60.sp,width: 60.sp,),
             SizedBox(height: 10,),
             Text("MCC MASJID SCARBOROUGH",style: robotoMedium.copyWith(color:Colors.amberAccent,fontSize: 11.sp),),
           ],
         ),
       ),
    ),
        ),
  );
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mccs_masjid/util/styles.dart';
import 'package:mccs_masjid/view/base/shakeWidget.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/app_constants.dart';
import '../../../base/custom_button.dart';
import '../../donation/dontaion_screen.dart';
import '../../webViewPage/web_view_screen.dart';

class DonationWidget extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/image/donation_bg.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [

                  Colors.amberAccent.withOpacity(0.4),

                  Colors.black.withOpacity(0.2),
                ]
            )
        ),

        padding: EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 30),
        child: Column(
          children: [
           Padding(
             padding:  EdgeInsets.only(left: 5.w,right: 5.w,top: 3.h,bottom: 3.h),
             child: Text("“Whoever builds a mosque, desiring thereby Allah’s pleasure, Allah builds for him the like of it in paradise.”",

               textAlign: TextAlign.center,
               style: robotoMedium.copyWith(color: Colors.amberAccent,fontSize: 12.sp),),
           ),

            SizedBox(height: 10,),
            ShakeWidget(
              child: CustomButton(
                width: 27.w,
                fontSize: 12.sp,
                  radius: 5,
                  color:Colors.white,
                  btnColor: Theme.of(context).primaryColor,
                  onPressed:(){
                    if (Platform.isAndroid) {
                      Get.to(WebViewPage(url: AppConstants.donationLink, title:"Donation" ));
                    } else if (Platform.isIOS) {
                      Get.to(DonationScreen());
                    }
                // Get.to(page);
              } , buttonText: "Donate Now"),
            )
          ],
        ),
      ),
    );
  }
}

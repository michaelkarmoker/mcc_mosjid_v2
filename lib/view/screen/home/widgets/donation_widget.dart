import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/util/styles.dart';
import 'package:qibla_finder/view/base/shakeWidget.dart';

import '../../../../util/app_constants.dart';
import '../../../base/custom_button.dart';
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
             padding: const EdgeInsets.only(left: 60.0,right: 60,top: 10,bottom: 10),
             child: Text("“Whoever builds a mosque, desiring thereby Allah’s pleasure, Allah builds for him the like of it in paradise.”",

               textAlign: TextAlign.center,
               style: robotoMedium.copyWith(color: Colors.amberAccent),),
           ),

            SizedBox(height: 10,),
            ShakeWidget(
              child: CustomButton(
                width: 100,
                fontSize: 15,
                  radius: 5,
                  color:Colors.white,
                  btnColor: Theme.of(context).primaryColor,
                  onPressed:(){
                    Get.to(WebViewPage(url: AppConstants.donationLink, title: 'Donation',));
                // Get.to(page);
              } , buttonText: "Donate Now"),
            )
          ],
        ),
      ),
    );
  }
}

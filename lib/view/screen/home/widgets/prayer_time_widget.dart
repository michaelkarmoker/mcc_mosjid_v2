import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/prayer_time_screen.dart';

import '../../../../util/styles.dart';

class PrayerTimeSliderWidget extends StatelessWidget {
  const PrayerTimeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text("Salah Timings",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              InkWell(
                  onTap: (){
                    Get.to(PrayerTimeScreen());
                  },
                  child: button(isRight: true))
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 150,
          padding: EdgeInsets.only(left: 10),


          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [


                timeBox(icon: 'assets/prayer_icon/fajr.png',title: "Fajr",adhanTime: '03:17 AM', time: '03:27 AM',),

                timeBox(icon: 'assets/prayer_icon/sunrise.png',title: "Sunrise",adhanTime: '04:50 AM', time: '05:04 AM'),

                timeBox(icon: 'assets/prayer_icon/dhuhr.png',title: "Dhuhr",adhanTime: '12:10 PM', time: '12:24 PM'),

                timeBox(icon: 'assets/prayer_icon/asar.png',title: "Asar",adhanTime: '04:10 PM', time: '04:24 PM'),

                timeBox(icon: 'assets/prayer_icon/magrib.png',title: "Magrib",adhanTime: '07:30 PM', time: '07:43 PM'),

                timeBox(icon: 'assets/prayer_icon/Isha.png',title: "Isha", adhanTime: '09:5 PM',time: '09:20 PM'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget button({required bool isRight}){
    return Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color:Theme.of(Get.context!).primaryColor.withOpacity(0.5)),
      child: Icon(isRight?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_new,color:Colors.grey[100],size: 20,),
    );
  }


  Widget timeBox({required String title,required String adhanTime,required String time,required String icon}){
    return Container(
      width: Get.width/3.3,
          margin: EdgeInsets.only(right: 10),

        decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(
             "assets/image/bjk.jpg"
           ),
           fit:BoxFit.fitHeight
         ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.black.withOpacity(0.4),
          ),
          padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Image.asset(icon,height: 40,),
              SizedBox(height: 5,),
              Text("${title}",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color:Colors.white),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Adhan: ", style: robotoMedium.copyWith(fontSize: 12,color: Colors.white)),
                  Text("${adhanTime}",
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(fontSize: 12,color: Colors.white),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Salah: ", style: robotoMedium.copyWith(fontSize: 12,color: Colors.white)),
                  Text("${time}",
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(fontSize: 12,color: Colors.white),),
                ],
              ),



            ],
          ),
        )
    );
  }
}

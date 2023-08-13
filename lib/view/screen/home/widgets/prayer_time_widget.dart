import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/controller/prayer_controller.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/prayer_time_screen.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../util/styles.dart';

class PrayerTimeSliderWidget extends StatelessWidget {
  const PrayerTimeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayerController>(

      builder: (controller) {
        return Column(
          children: [
            controller.prayerTimeList.length>0?Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12),
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
                  height: Get.height/4.6,



                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          timeBox(icon: 'assets/prayer_icon/fajr.png',title: "${controller.prayerTimeList[0].prayerName}",adhanTime: '${controller.prayerTimeList[0].azanTime!.replaceRange(5,6," ")}', time: '${controller.prayerTimeList[0].prayerTime!.replaceRange(5,6," ")}',),

                          //timeBox(icon: 'assets/prayer_icon/sunrise.png',title: "${controller.prayerTimeList[1].prayerName}",adhanTime: '${controller.prayerTimeList[1].azanTime}', time: '${controller.prayerTimeList[1].prayerTime}'),
                          timeBox(icon: 'assets/prayer_icon/dhuhr.png',title: "${controller.prayerTimeList[1].prayerName}",adhanTime: '${controller.prayerTimeList[1].azanTime!.replaceRange(5,6," ")}', time: '${controller.prayerTimeList[1].prayerTime!.replaceRange(5,6," ")}'),

                          timeBox(icon: 'assets/prayer_icon/asar.png',title: "${controller.prayerTimeList[2].prayerName}",adhanTime: '${controller.prayerTimeList[2].azanTime!.replaceRange(5,6," ")}', time: '${controller.prayerTimeList[2].prayerTime!.replaceRange(5,6," ")}'),

                          timeBox(icon: 'assets/prayer_icon/magrib.png',title: "${controller.prayerTimeList[3].prayerName}",adhanTime: '${controller.prayerTimeList[3].azanTime!}', time: '${controller.prayerTimeList[3].prayerTime!}'),

                          timeBox(icon: 'assets/prayer_icon/Isha.png',title: "${controller.prayerTimeList[4].prayerName}",adhanTime: '${controller.prayerTimeList[4].azanTime!.replaceRange(5,6," ")}', time: '${controller.prayerTimeList[4].prayerTime!.replaceRange(5,6," ")}'),

                          timeBox(icon: 'assets/prayer_icon/jummah.png',title: "${controller.prayerTimeList[5].prayerName}", adhanTime: '${controller.prayerTimeList[5].azanTime!.replaceRange(5,6," ")}',time: '${controller.prayerTimeList[5].prayerTime!.replaceRange(5,6," ")}'),


                  /*        timeBox(icon: 'assets/prayer_icon/fajr.png',title: "${controller.prayerTimeList[0].prayerName}",adhanTime: '${controller.prayerTimeList[0].azanTime}', time: '${controller.prayerTimeList[0].prayerTime}',),

                          //timeBox(icon: 'assets/prayer_icon/sunrise.png',title: "${controller.prayerTimeList[1].prayerName}",adhanTime: '${controller.prayerTimeList[1].azanTime}', time: '${controller.prayerTimeList[1].prayerTime}'),
                          timeBox(icon: 'assets/prayer_icon/dhuhr.png',title: "${controller.prayerTimeList[1].prayerName}",adhanTime: '${controller.prayerTimeList[1].azanTime}', time: '${controller.prayerTimeList[1].prayerTime}'),

                          timeBox(icon: 'assets/prayer_icon/asar.png',title: "${controller.prayerTimeList[2].prayerName}",adhanTime: '${controller.prayerTimeList[2].azanTime}', time: '${controller.prayerTimeList[2].prayerTime}'),

                          timeBox(icon: 'assets/prayer_icon/magrib.png',title: "${controller.prayerTimeList[3].prayerName}",adhanTime: '${controller.prayerTimeList[3].azanTime}', time: '${controller.prayerTimeList[3].prayerTime}'),

                          timeBox(icon: 'assets/prayer_icon/Isha.png',title: "${controller.prayerTimeList[4].prayerName}",adhanTime: '${controller.prayerTimeList[4].azanTime}', time: '${controller.prayerTimeList[4].prayerTime}'),

                          timeBox(icon: 'assets/prayer_icon/jummah.png',title: "${controller.prayerTimeList[5].prayerName}", adhanTime: '${controller.prayerTimeList[5].azanTime}',time: '${controller.prayerTimeList[5].prayerTime}'),
             */           ],
                      ),
                    ),
                  ),
                ),
              ],
            ): Padding(
              padding: const EdgeInsets.all(12.0),
              child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,

                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),

                          width: Get.width,
                          height: 30,
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: Get.height/4.6,
                          child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Container(

                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),

                                width: Get.width/3.4,
                                height: 150,
                              );
                            },

                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        );
      }
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
    return Card(

      margin: EdgeInsets.only(left: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(

        width: Get.width/3.4,


          decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage(
               "assets/prayer_icon/prayer_bg.jpg"
             ),

             fit:BoxFit.cover
           ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0XFF6D8085).withOpacity(0.2),
            ),
            padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Image.asset(icon,height: 40,),
                SizedBox(height: 5,),
                Text("${title}",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color:Colors.black87),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(
                        flex: 1,
                        child: Image.asset("assets/icon/azan_time.png",height: 25,)),

                    Expanded(
                      flex: 2,
                      child: Text("${adhanTime.toUpperCase()}",
                        textAlign: TextAlign.left,
                        style: robotoMedium.copyWith(fontSize: 12,color: Colors.green),),
                    ),
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex:1,child: Image.asset("assets/image/clock.png",height: 23)),
                    Expanded(
                      flex: 2,
                      child: Text("${time.toUpperCase()}",
                        textAlign: TextAlign.left,
                        style: robotoMedium.copyWith(fontSize: 12,color: Colors.green),),
                    ),
                  ],
                ),




              ],
            ),
          )
      ),
    );
  }
}

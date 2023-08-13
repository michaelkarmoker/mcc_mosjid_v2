import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/controller/prayer_controller.dart';
import 'package:qibla_finder/data/model/response/PrayerTimeResponse.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/util/dimensions.dart';

import '../../../../util/styles.dart';
import 'custom_edit_dialog.dart';

class PrayerTimeUpdateWidget extends StatefulWidget {
  final String date;
  final PrayerController controller;

  PrayerTimeUpdateWidget({super.key, required this.date, required this.controller});

  @override
  State<PrayerTimeUpdateWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeUpdateWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        child: Column(
          children: [


            SizedBox(height: 10,),
            Container(
                decoration: BoxDecoration(

                  //borderRadius: BorderRadius.all(Radius.circular(8))
                ),

                child: Column(
              children: [
                
                prayerTimeRow(id:"${widget.controller.prayerTimeList[0].prayerId}",icon: 'assets/prayer_icon/fajr.png',title: "${widget.controller.prayerTimeList[0].prayerName}",adhanTime: '${widget.controller.prayerTimeList[0].azanTime!.replaceRange(5,6," ")}', time: '${widget.controller.prayerTimeList[0].prayerTime!.replaceRange(5,6," ")}',),

                //timeBox(icon: 'assets/prayer_icon/sunrise.png',title: "${controller.prayerTimeList[1].prayerName}",adhanTime: '${controller.prayerTimeList[1].azanTime}', time: '${controller.prayerTimeList[1].prayerTime}'),
                prayerTimeRow(id:"${widget.controller.prayerTimeList[1].prayerId}",icon: 'assets/prayer_icon/dhuhr.png',title: "${widget.controller.prayerTimeList[1].prayerName}",adhanTime: '${widget.controller.prayerTimeList[1].azanTime!.replaceRange(5,6," ")}', time: '${widget.controller.prayerTimeList[1].prayerTime!.replaceRange(5,6," ")}'),

                prayerTimeRow(id:"${widget.controller.prayerTimeList[2].prayerId}",icon: 'assets/prayer_icon/asar.png',title: "${widget.controller.prayerTimeList[2].prayerName}",adhanTime: '${widget.controller.prayerTimeList[2].azanTime!.replaceRange(5,6," ")}', time: '${widget.controller.prayerTimeList[2].prayerTime!.replaceRange(5,6," ")}'),

                prayerTimeRow(id:"${widget.controller.prayerTimeList[3].prayerId}",icon: 'assets/prayer_icon/magrib.png',title: "${widget.controller.prayerTimeList[3].prayerName}",adhanTime: '${widget.controller.prayerTimeList[3].azanTime!}', time: '${widget.controller.prayerTimeList[3].prayerTime!}'),

                prayerTimeRow(id:"${widget.controller.prayerTimeList[4].prayerId}",icon: 'assets/prayer_icon/Isha.png',title: "${widget.controller.prayerTimeList[4].prayerName}",adhanTime: '${widget.controller.prayerTimeList[4].azanTime!.replaceRange(5,6," ")}', time: '${widget.controller.prayerTimeList[4].prayerTime!.replaceRange(5,6," ")}'),

                prayerTimeRow(id:"${widget.controller.prayerTimeList[5].prayerId}",icon: 'assets/prayer_icon/jummah.png',title: "${widget.controller.prayerTimeList[5].prayerName}", adhanTime: '${widget.controller.prayerTimeList[5].azanTime!.replaceRange(5,6," ")}',time: '${widget.controller.prayerTimeList[5].prayerTime!.replaceRange(5,6," ")}'),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget button({required bool isRight}){
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color:Theme.of(Get.context!).primaryColor.withOpacity(0.5)),
      child: Icon(isRight?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_new,color:Colors.grey[100],size: 20,),
    );
  }

  Widget title(){
    return Container(


      padding: EdgeInsets.only(left: 15,right:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,

                child: Image.asset("assets/prayer_icon/name_salat.png",height: 30,)),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,

                  child: Image.asset("assets/icon/adhan.png",height: 30,))),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset("assets/image/clock.png",height: 30,))),
        ],
      )
    );
  }

  Widget prayerTimeRow({required String id,required String title,required String time,required String adhanTime,required String icon}){
    return Padding(
      padding: const EdgeInsets.only(left: 3.0,right: 3,),
      child: InkWell(
        onTap: (){
          Get.dialog(CustomEditDialog(yesBtntap: () {


          }, salatName:title,prayertime:time , adhantime:adhanTime, id: id,));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: Colors.white70,
          elevation: 0,
          child: Container(
              padding: EdgeInsets.only(left: 8,right: 8,top: 10,bottom:10),
             /* decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),*/
              child: Column(
                children: [
                  Row(
             crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name of Salat",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("Azan Time",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("Prayer Time",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                          ],
                        ),
                      ),

                    Expanded(
                        flex: 3,
                        child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(": ${title}",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                        SizedBox(height: 5,),
                        Text(": ${adhanTime.toUpperCase()}",
                          textAlign: TextAlign.start,
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                        SizedBox(height: 5,),
                        Text(": ${time.toUpperCase()}",
                          textAlign: TextAlign.start,
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.black),),
                      ],
                    )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child:Center(
                              child:  Image.asset("assets/icon/edit.png",height: 30,),
                            ),
                          )
                      ),
                    ],
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}

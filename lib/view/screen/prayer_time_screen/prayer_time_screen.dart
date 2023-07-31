import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:qibla_finder/controller/compass_controller.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../home/widgets/prayer_time_widget.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  late HijriCalendar? _today;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HijriCalendar _today = HijriCalendar.now();
    print(_today);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(

        centerTitle: false,
        title: Container(child: Text("Salah Timings",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),
      ),
      body: Container(
         decoration: BoxDecoration(

      gradient: LinearGradient(colors: [
      Color(0xffFEF5ED).withOpacity(0.4),

        Color(0xff449D44).withOpacity(0.2),
        ]
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
        child: Column(
           children: [
           Container(
             alignment: Alignment.bottomLeft,
             width: Get.width,
             height: Get.height/3.5,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/image/bg_head.jpg"),
                 fit: BoxFit.cover
               )
             ),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   height: 110,
                   width: Get.width,
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                       color: Colors.black.withOpacity(0.2),

                   ),

                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       SizedBox(height: 10,),
                       Row(
                         children: [
                           Icon(Icons.circle,size: 20,color: Color(0xffD6E8D6)),
                           SizedBox(width: 10,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("${DateConverter.isoStringToLocalDateOnly(DateTime.now().toIso8601String())}",style: robotoMedium.copyWith(color: Colors.white),),
                               Text("${HijriCalendar.now().toFormat("MMMM dd yyyy")}",style: robotoMedium.copyWith(color: Colors.white)),
                             ],
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Icon(Icons.pin_drop,size: 20,color:Color(0xffD6E8D6),),
                           SizedBox(width: 10,),
                           Text("${Get.find<CompassController>().locationAddress}",style: robotoMedium.copyWith(color: Colors.white)),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ) ,
           ),
            PrayerTimeWidget(date: HijriCalendar.now().toFormat("MMMM dd yyyy"),)
           ],
        ),
      ),
    );
  }
}

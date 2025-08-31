import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:mccs_masjid/controller/auth_controller.dart';
import 'package:mccs_masjid/controller/compass_controller.dart';
import 'package:mccs_masjid/controller/prayer_controller.dart';
import 'package:mccs_masjid/helper/date_converter.dart';
import 'package:mccs_masjid/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';
import 'package:flutter/material.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../home/widgets/prayer_time_widget.dart';
import '../prayer_time_update_screen/prayer_time_update_screen.dart';

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
bool isEdit=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Container(child: Text("Salah Timings",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge,color: Colors.white),)),
        actionsIconTheme: IconThemeData(color:Colors.white),
        actions: [
          Get.find<AuthController>().isLoggedIn()?InkWell(
            onTap: (){
              Get.to(PrayerTimeUpdateScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 Image.asset("assets/icon/edit2.png",width: 20,color: Colors.white,),
                  SizedBox(width: 10,)
                ],
              ),
            ),
          ):SizedBox()
        ],
      ),
      body: GetBuilder<PrayerController>(

        builder: (controller) {
          return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/image/qibla_bg_ss.png"
                    ),
                    fit:BoxFit.fill
                ),

              ),
            child: Container(
              decoration: BoxDecoration(
                   gradient: LinearGradient(
                        begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: [

                      Colors.black.withOpacity(0.9),
                         Colors.black.withOpacity(0.3),

                   ]

                   ),



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
                             gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.topRight,
                               colors: [
                                 Colors.black.withOpacity(0.8),
                                 Colors.black.withOpacity(0.0),


                               ]
                             )

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
                             Get.find<CompassController>().locationAddress==null?SizedBox():Row(
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
                  controller.prayerTimeList.length>0?Expanded(child: PrayerTimeWidget(date: HijriCalendar.now().toFormat("MMMM dd yyyy"), controller: controller,)):SizedBox()
                 ],
              ),
            ),
          );
        }
      ),
    );
  }
}

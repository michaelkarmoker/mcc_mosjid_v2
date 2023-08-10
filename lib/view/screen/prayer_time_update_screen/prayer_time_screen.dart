import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:qibla_finder/controller/auth_controller.dart';
import 'package:qibla_finder/controller/compass_controller.dart';
import 'package:qibla_finder/controller/prayer_controller.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:qibla_finder/view/screen/prayer_time_update_screen/widget/prayer_time_widget.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../home/widgets/prayer_time_widget.dart';

class PrayerTimeUpdateScreen extends StatefulWidget {
  const PrayerTimeUpdateScreen({super.key});

  @override
  State<PrayerTimeUpdateScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeUpdateScreen> {
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


        centerTitle: false,
        title: Container(child: Text("Salah Timings Update",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),

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
              height: Get.height,
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
              child: SingleChildScrollView(
                child: Column(
                   children: [
                     PrayerTimeUpdateWidget(date: HijriCalendar.now().toFormat("MMMM dd yyyy"), controller: controller,)

                   ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

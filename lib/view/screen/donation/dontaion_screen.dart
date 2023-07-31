/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:qibla_finder/controller/compass_controller.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/view/base/custom_text_field.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../home/widgets/prayer_time_widget.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<DonationScreen> {


  TextEditingController emailCtr=new TextEditingController();
  FocusNode emailFcs=new FocusNode();
  TextEditingController messageCtr=new TextEditingController();
  FocusNode messageFcs=new FocusNode();
  TextEditingController nameCardCtr=new TextEditingController();
  FocusNode nameCardFcs=new FocusNode();
  TextEditingController cardNumberCtr=new TextEditingController();
  FocusNode cardNumberFcs=new FocusNode();
  TextEditingController cardExpiredCtr=new TextEditingController();
  FocusNode cardExpiredFcs=new FocusNode();
  TextEditingController cardCvcCtr=new TextEditingController();
  FocusNode cardCvcFcs=new FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(

        centerTitle: false,
        title: Container(child: Text("Donation",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),
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
            CustomTextField(controller: controller, focusNode: focusNode, nextFocus: nextFocus, onSubmit: onSubmit)
          ],
        ),
      ),
    );
  }
}
*/

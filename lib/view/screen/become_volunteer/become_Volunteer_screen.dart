import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:mccs_masjid/controller/compass_controller.dart';
import 'package:mccs_masjid/helper/date_converter.dart';
import 'package:mccs_masjid/view/base/custom_button.dart';
import 'package:mccs_masjid/view/base/custom_text_field.dart';
import 'package:mccs_masjid/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../../base/my_text_field.dart';
import '../home/widgets/prayer_time_widget.dart';

class BecomeVolunteerScreen extends StatefulWidget {
  const BecomeVolunteerScreen({super.key});

  @override
  State<BecomeVolunteerScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<BecomeVolunteerScreen> {


  TextEditingController nameCtr=new TextEditingController();
  FocusNode nameFcs=new FocusNode();

  TextEditingController emailCtr=new TextEditingController();
  FocusNode emailFcs=new FocusNode();


  TextEditingController askCtr=new TextEditingController();
  FocusNode askFcs=new FocusNode();
 /* TextEditingController messageCtr=new TextEditingController();
  FocusNode messageFcs=new FocusNode();
  TextEditingController nameCardCtr=new TextEditingController();
  FocusNode nameCardFcs=new FocusNode();
  TextEditingController cardNumberCtr=new TextEditingController();
  FocusNode cardNumberFcs=new FocusNode();
  TextEditingController cardExpiredCtr=new TextEditingController();
  FocusNode cardExpiredFcs=new FocusNode();
  TextEditingController cardCvcCtr=new TextEditingController();
  FocusNode cardCvcFcs=new FocusNode();*/


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
        title: Container(child: Text("Become our volunteer",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg_parttern.png"),
            fit: BoxFit.fitHeight,
          ),

        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                      SizedBox(height: 10,),
                Text("Submit your information below to become our volunteer",style: robotoMedium.copyWith(fontSize: 14),),
                SizedBox(height: 10,),
                MyTextField(controller: nameCtr, focusNode: nameFcs, nextFocus: emailFcs, onSubmit: null,
                  hintText: "Enter your full name",
                  title: 'Name',),
                SizedBox(height: 10,),
                MyTextField(controller: emailCtr, focusNode: emailFcs, nextFocus: askFcs, onSubmit: null,
                  hintText: "Enter your email address",
                  title: 'Email',),
                SizedBox(height: 10,),
                MyTextField(controller: askCtr, focusNode: askFcs, nextFocus: null, onSubmit: null,
                  hintText: "Enter your opinion",
                  title: 'What do want to Volunteer for',),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0,right: 50),
                  child: CustomButton(onPressed: (){}, buttonText: "Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

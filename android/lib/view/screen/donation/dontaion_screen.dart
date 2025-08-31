import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:mccs_masjid/controller/compass_controller.dart';
import 'package:mccs_masjid/helper/date_converter.dart';
import 'package:mccs_masjid/view/base/custom_snackbar.dart';
import 'package:mccs_masjid/view/base/custom_text_field.dart';
import 'package:mccs_masjid/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/app_constants.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("If you want to donate, please click the link below or copy the link, and paste it into your browser.",style: robotoRegular.copyWith(
                  fontSize: 15.sp,
                  color: Colors.black),),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: InkWell(
                        onTap: (){
                          _launchURL(AppConstants.donationLink);
                        },
                        child: Text("${AppConstants.donationLink}",style: robotoRegular.copyWith(
                          decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontSize: 12.sp,
                            color: Colors.blue),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: (){
                            Clipboard.setData(new ClipboardData(text: AppConstants.donationLink));
                            showCustomSnackBar("Copied on clipboard", isError: false);
                          },
                          child: Icon(Icons.copy,color: Theme.of(context).primaryColor,size: 25,)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _launchURL(String url) async {

    final uri = Uri.parse(url);
    await launchUrl(uri,mode: LaunchMode.externalApplication);

/*if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }*/

  }
}

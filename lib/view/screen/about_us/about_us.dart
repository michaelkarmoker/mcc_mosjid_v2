import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:qibla_finder/controller/compass_controller.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/view/base/custom_button.dart';
import 'package:qibla_finder/view/base/custom_text_field.dart';
import 'package:qibla_finder/view/screen/prayer_time_screen/widget/prayer_time_widget.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../../base/my_text_field.dart';
import '../home/widgets/prayer_time_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<AboutUsScreen> {





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
        title: Container(child: Text("About Us",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/bg_parttern.png"),
              fit: BoxFit.cover,
            ),

          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                        Text("MCC Centre Scarborough MASJID",
                          textAlign: TextAlign.center,
                          style: robotoMedium.copyWith(fontSize: 18),),

             SizedBox(height: 20,),
                  Text("Muslim Circle of Canada serves Canadian society at large through its own initiatives and as well as positive engagement with others. It inspires all people to uphold the values of justice, law, values of faith, and cooperation that are relevant to Canadian Society.",
                    textAlign: TextAlign.start,
                    style: robotoRegular.copyWith(fontSize: 14),),
                  SizedBox(height: 20,),
                  Text("MCC offers a holistic approach to Islam within the multicultural Canadian Society. It believes in the personal development of every individual is the key to social development. MCC respects all faiths and Canadian traditions, institutions, and values. It focuses on a holistic, balanced, and involved understanding of Islam among Canadian Muslims.",
                    textAlign: TextAlign.start,
                    style: robotoRegular.copyWith(fontSize: 14),),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height/3.5,
                          padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.black87.withOpacity(0.2),
                           borderRadius: BorderRadius.all(Radius.circular(10))
                           ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container( 
                                padding: EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(300))
                                ),

                                  child: Icon(Icons.remove_red_eye,size: 20,color: Colors.white,)),
                             SizedBox(height: 10,),
                              Text("A unit and strong Muslim community preparing leaders and volunteers contributing prosperity for all Canadians.",
                                textAlign: TextAlign.center,
                                style: robotoRegular.copyWith(fontSize: 14),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          height: Get.height/3.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black87.withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),

                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(300))
                                  ),

                                  child: Icon(Icons.flag,size: 20,color: Colors.white,)),
                              SizedBox(height: 10,),
                              Text("We aspire to become an Islamic Center that strengthens Muslim families’ faith and well-being and serves and educates the next generations.",
                                textAlign: TextAlign.center,
                                style: robotoRegular.copyWith(fontSize: 14),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height/3.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black87.withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),

                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(300))
                                  ),

                                  child: Icon(Icons.list,size: 20,color: Colors.white,)),
                              SizedBox(height: 10,),
                              Text("Being compassionate, accountable, and respectful to everyone regardless of race, culture, religion, or gender is a core aspect of our religion.",
                                textAlign: TextAlign.center,
                                style: robotoRegular.copyWith(fontSize: 14),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                         
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/util/images.dart';
import 'package:qibla_finder/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/response/PrayerTimeResponse.dart';
import '../../../../helper/date_converter.dart';
import '../../../base/my_text_field.dart';


class CustomEditDialog extends StatefulWidget {


  final String salatName;
  final String prayertime;
  final String adhantime;
  final bool isError;
  final Function() yesBtntap;
   CustomEditDialog({Key? key,required this.yesBtntap, this.isError=false, required this.salatName, required this.prayertime, required this.adhantime,}) : super(key: key);

  @override
  State<CustomEditDialog> createState() => _CustomEditDialogState();
}

class _CustomEditDialogState extends State<CustomEditDialog> {

  TimeOfDay _time = TimeOfDay(hour: 23, minute: 15);

  void _selectTime(String time,bool isAdhanTime) async {
    // _time=TimeOfDay(hour:time.substring(0,1), minute: minute)
    String timess=time.replaceRange(5,6,"");
    String a=DateConverter.print24(timess);
    _time=TimeOfDay(hour:int.parse(a.substring(0,2)), minute:int.parse(a.substring(3,5)));
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        if(isAdhanTime){
          adhanCtr.text=DateConverter.stringToStringTime(newTime.hour.toString()+":"+newTime.minute.toString()+":"+"00");
        }else{
          prayerCtr.text=DateConverter.stringToStringTime(newTime.hour.toString()+":"+newTime.minute.toString()+":"+"00");

        }
       // _time = newTime;
      });
    }
  }




  TextEditingController salatCtr=new TextEditingController();

  FocusNode salatFcs=new FocusNode();

  TextEditingController adhanCtr=new TextEditingController();

  FocusNode adhanFcs=new FocusNode();

  TextEditingController prayerCtr=new TextEditingController();

  FocusNode prayerFcs=new FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    salatCtr.text=widget.salatName!;
    adhanCtr.text=widget.adhantime!;
    prayerCtr.text=widget.prayertime!;

  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  MyTextField(
                    isEnabled: false,
                    controller: salatCtr,
                    focusNode: salatFcs,
                    hintText: "Enter Salat Name",
                    title: 'Name of Salat',),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child:adhanCtr.text.contains(":")?InkWell(
                        onTap: (){

                          _selectTime(adhanCtr.text,true);
                        },
                        child: MyTextField(
                          isEnabled: false,
                          controller: adhanCtr,

                          hintText: "Enter Azan Time",
                          focusNode: adhanFcs, title: 'Azan Time',),
                      ):MyTextField(
                        isEnabled: true,
                        controller: adhanCtr,

                        hintText: "Enter Azan Time",
                        focusNode: adhanFcs, title: 'Azan Time',)),
                      SizedBox(width: 6,),
                      Expanded(child: prayerCtr.text.contains(":")?InkWell(
                        onTap: (){
                          _selectTime(prayerCtr.text,false);
                        },
                        child: MyTextField(
                          isEnabled: false,
                          controller: prayerCtr,
                          hintText: "Enter Salat Time",
                          focusNode: prayerFcs, title: 'Salat Time',),
                      ):MyTextField(
                        isEnabled: true,
                        controller: prayerCtr,
                        hintText: "Enter Salat Time",
                        focusNode: prayerFcs, title: 'Salat Time',),),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child: Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                       border: Border(
                          right: BorderSide( //                   <--- right side
                            color: Colors.black12,
                            width: 1.5,
                          ),
                         top: BorderSide( //                   <--- right side
                           color: Colors.black12,
                           width: 1.5,
                         ),
                      ),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("Cancel",textAlign:TextAlign.center,
                            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                color: Colors.red,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: widget.yesBtntap,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide( //                   <--- right side
                            color: Colors.black12,
                            width: 1.5,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("Save",textAlign:TextAlign.center,
                            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

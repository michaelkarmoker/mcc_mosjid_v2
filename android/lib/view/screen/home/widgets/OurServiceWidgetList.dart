import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mccs_masjid/helper/date_converter.dart';
import 'package:mccs_masjid/util/dimensions.dart';
import 'package:mccs_masjid/util/styles.dart';
import 'package:sizer/sizer.dart';

class OurServiceWidgetList extends StatelessWidget {
  final List<Service> serviceList;
  OurServiceWidgetList({super.key, required this.serviceList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Our Service's",style: robotoMedium.copyWith(fontSize: 12.sp),),
          SizedBox(height: 2.h,),
          GridView.builder(
              itemCount:serviceList.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 0.7,
                   mainAxisSpacing:2.h ,
                   crossAxisSpacing: 3.w,

                   crossAxisCount: 2),
              physics:NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/image/service_bg.jpg"
                        ),
                        fit:BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                      Colors.green.withOpacity(0.3),

                        Colors.black.withOpacity(0.4),
                  ]
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.width>500?8.h:5.h,),
                        Image.asset(serviceList[index].icon!,height: 6.h,),
                        SizedBox(height: 2.h,),
                        Text("${serviceList[index].title}",
                          textAlign: TextAlign.center,
                          style: robotoMedium.copyWith(color: Colors.white,fontSize:12.sp),),
                        SizedBox(height: 1.h,),
                        Expanded(
                          child: Text("${serviceList[index].description}",
                             maxLines: 5,
                            overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,style: robotoRegular.copyWith(
                              color: Colors.white,
                              height:1.3,fontSize:9.sp),),
                        ),

                      ],
                    ),
                  ),
                );
          }, )
        ],
      ),
    );
  }
}
class Service{
  String? title;
  String? description;
  String? icon;

  Service(this.title, this.description,this.icon);
}
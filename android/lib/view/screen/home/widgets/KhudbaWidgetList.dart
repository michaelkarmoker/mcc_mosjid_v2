import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mccs_masjid/helper/date_converter.dart';
import 'package:mccs_masjid/util/dimensions.dart';
import 'package:mccs_masjid/util/styles.dart';
import 'package:mccs_masjid/util/app_constants.dart';
import 'package:sizer/sizer.dart';

class KhudbaWidgetList extends StatelessWidget {
  final List<Khutbah> khudbahList;

  KhudbaWidgetList({super.key, required this.khudbahList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 2.h),
            child: Text("Friday's Khutbah", style: robotoMedium.copyWith(
                fontSize: 12.sp),),
          ),
          SizedBox(height: 2.h,),
          Expanded(
            child: ListView.builder(
                itemCount: khudbahList.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: InkWell(
                      onTap: () {
                        AppConstants.launchYouTube(urls: khudbahList[index].url!, );
                      },
                      child: ClipRRect(

                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(

                          decoration: BoxDecoration(

                              image: DecorationImage(
                                image: AssetImage(khudbahList[index].image!),
                                fit: BoxFit.fill,

                              )
                          ),
                          width: (Get.width) - 26,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.black87.withOpacity(0.4),
                                child: Center(

                                  child: Icon(Icons.play_circle, size: 12.w,
                                    color: Colors.white70,),


                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child:
                                  Text("${DateConverter.stringToLocalDateOnly(
                                      khudbahList[index].date!)}",
                                    style: robotoMedium.copyWith(
                                      fontSize: 10.sp,
                                        color: Colors.white70
                                    ),))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}


class Khutbah{
  String? date;
  String? url;
  String? image;

  Khutbah(this.date, this.url, this.image);

}
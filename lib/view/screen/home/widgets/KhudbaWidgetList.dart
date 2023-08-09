import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/util/styles.dart';
import 'package:qibla_finder/util/app_constants.dart';

class KhudbaWidgetList extends StatelessWidget {
  final List<Khutbah> khudbahList;

  KhudbaWidgetList({super.key, required this.khudbahList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Friday's Khutbah", style: robotoMedium.copyWith(
                fontSize: Dimensions.fontSizeLarge),),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                itemCount: khudbahList.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15),
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

                                  child: Icon(Icons.play_circle, size: 50,
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
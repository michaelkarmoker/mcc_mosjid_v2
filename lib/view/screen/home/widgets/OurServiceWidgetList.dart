import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qibla_finder/helper/date_converter.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/util/styles.dart';

class OurServiceWidgetList extends StatelessWidget {
  final List<Service> serviceList;
  OurServiceWidgetList({super.key, required this.serviceList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Our Service's",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
          SizedBox(height: 10,),
          GridView.builder(
              itemCount:serviceList.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio:  MediaQuery.of(context).size.width /
                       (MediaQuery.of(context).size.height / 1.3),
                   mainAxisSpacing:15 ,
                   crossAxisSpacing: 15,

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
                    padding: EdgeInsets.all(10),
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
                        SizedBox(height: 44,),
                        Image.asset(serviceList[index].icon!,height: 48,),
                        SizedBox(height: 10,),
                        Text("${serviceList[index].title}",style: robotoMedium.copyWith(color: Colors.white,fontSize:15),),
                        SizedBox(height: 5,),
                        Text("${serviceList[index].description}",textAlign:TextAlign.center,style: robotoRegular.copyWith(
                            color: Colors.white,
                            height:1.3,fontSize:13),),

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
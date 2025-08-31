import 'dart:math';

import 'package:flutter/services.dart';
import 'package:mccs_masjid/controller/compass_controller.dart';
import 'package:mccs_masjid/util/dimensions.dart';
import 'package:mccs_masjid/view/base/custom_snackbar.dart';
import 'package:mccs_masjid/view/screen/compass_screen/widget/clipShadowShadowPainter.dart';
import 'package:mccs_masjid/view/screen/compass_screen/widget/compassViewPainterWidgets.dart';
import 'package:mccs_masjid/view/screen/compass_screen/widget/compass_display.dart';
import 'package:mccs_masjid/view/screen/compass_screen/widget/neumorphism.dart';
import 'package:mccs_masjid/view/screen/compass_screen/widget/triangle_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vibration/vibration.dart';
import 'dart:ui' as ui;

import '../../../../util/styles.dart';




class CompassWidgets extends StatefulWidget {
 final Size size;
  final AnimationController? animationController;
   CompassWidgets({super.key,required this.animationController, required this.size});

  @override
  State<CompassWidgets> createState() => _CompassScreenState();
}


class _CompassScreenState extends State<CompassWidgets> {
  double? direction;

  ui.Image? image;
   Animation<double>? animation;

  double begin = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load("assets/icon/kaaba.png");

   // Get.find<CompassController>().checkPermission();
    animation = Tween(begin: 0.0, end: 0.0).animate(widget.animationController!);

  }


  @override
  Widget build(BuildContext context) {
    final size=widget.size;
    print(size);
    return GetBuilder<CompassController>(

        builder: (controller) {
          return !controller.isLoading?StreamBuilder(
              stream: FlutterCompass.events,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Text("Eror reading ");
                }
                /*if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }*/
                direction=snapshot.data?.heading??0.0;
                /*if(snapshot.data?.heading==null){
                  showCustomSnackBar("Device does not have sensor");

                }*/
                animation = Tween(begin: begin, end: (direction! * (pi / 180) * -1)).animate(widget.animationController!);
                begin = (direction! * (pi / 180) * -1);
                widget.animationController!.forward(from: 0);
                print(headingDegree(direction!).toInt());
                print(controller.bearing.round());
                print("qibla direction${direction}");
                return Stack(
                  children: [
                    Neumorphism(
                      isReserve: false,
                      blur: 300,
                      margin: EdgeInsets.all(size.width*0.03),
                      padding: EdgeInsets.all(10),
                      child: AnimatedBuilder(
                          animation: animation!,
                          builder: (context, child) {
                            return Transform.rotate(
                              // angle: (direction! *(pi/180)*-1),
                              angle:animation!.value,
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: size,
                                    painter: CompassViewPainter(
                                        cardinalityFontSize: 12,
                                        majorScaleFontSize: 8,
                                        color: grayColor,qiblaPositon: controller.bearing),
                                  ),


                                 // CompassDisplay(size: size,),

                                  Transform.rotate(
                                    angle: (controller.bearing * pi / 180),
                                    //angle: 0,
                                    child: Stack(
                                      children: [
                                        Container(
                                          // color: Colors.red,

                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                ClipShadowPath(shadow: Shadow(
                                                    blurRadius: 1
                                                ), clipper: TrianglePainter(isReverse: false,centerRoundSize: 10), child: Container(
                                                  /*child: Padding(
                                        padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
                                        child: Image.asset("assets/icon/kaaba.png",height: 5,),
                                      )*/
                                                  height: size.height*0.1800,
                                                  width: size.width*0.12,
                                                  color: Colors.amber,
                                                ),),

                                                ClipShadowPath(shadow: Shadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey.shade900
                                                ), clipper: TrianglePainter( isReverse: true,centerRoundSize: 10), child: Container(
                                                  height: size.height*0.1800,
                                                  width: size.width*0.12,
                                                  color: Colors.grey,
                                                ),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: (size.height/2)-size.height*0.510,
                                            left:(size.width/2)-size.width*0.14,
                                            child: Image.asset("assets/icon/kaaba.png",
                                              height: 25,
                                              width: 25,
                                            ))
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          }
                      ),
                    ),
                    /* Positioned(
                          top: size.height*0.136,
                          right: (size.width*0.5)-29,
                          child: Container(
                            child: Image.asset("assets/icon/star.png",height:50,color:isEqualToDegree(direction!,controller.bearing,controller.isVibration)? Colors.amberAccent:Colors.grey,),
                          )),*/

                  ],
                );
              }
          ):Container(
            child: Center(child: CircularProgressIndicator(color: greenColor,)),
          );

        }
    );
  }
  double headingDegree(double heading){
          return heading<0?360-heading.abs():heading;
  }

  String getDirection(double direction){
    if(direction>=337.5||direction<22.5){
      return "N";
    }else if(direction>=22.5&& direction<67.5){
      return "NE";
    }
    else if(direction>=67.5&& direction<112.5){
      return "E";
    }
    else if(direction>=112.5&& direction<157.5){
      return "SE";
    }
    else if(direction>=157.5&& direction<202.5){
      return "S";
    }
    else if(direction>=202.5&& direction<247.5){
      return "SW";
    }
    else if(direction>=247.5&& direction<292.5){
      return "W";
    }
    else if(direction>=292.5&& direction<337.5){
      return "NW";
    }else{
      return "N";
    }
  }
  bool isEqualToDegree(double direction,double bearing,bool isVibration){
    int directionInteger=headingDegree(direction!).toInt();
   int  bearingInteger=bearing.round();
    if(bearingInteger+2>=directionInteger&&bearingInteger-2<=directionInteger){
      if (isVibration) {
        Vibration.vibrate(duration: 100);
    }
      return true;
    }
    return false;
  }
  void _load(String path) async {
    var bytes = await rootBundle.load(path);
    image = await decodeImageFromList(bytes.buffer.asUint8List());
    setState(() {});
  }
}

import 'dart:math';

import 'package:flutter/services.dart';
import 'package:qibla_finder/controller/compass_controller.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/view/screen/compass_screen/widget/clipShadowShadowPainter.dart';
import 'package:qibla_finder/view/screen/compass_screen/widget/compassViewPainterWidgets.dart';
import 'package:qibla_finder/view/screen/compass_screen/widget/compass_display.dart';
import 'package:qibla_finder/view/screen/compass_screen/widget/neumorphism.dart';
import 'package:qibla_finder/view/screen/compass_screen/widget/triangle_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vibration/vibration.dart';
import 'dart:ui' as ui;
import '../../../util/styles.dart';



class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}
Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _CompassScreenState extends State<CompassScreen> with SingleTickerProviderStateMixin {
  double? direction;

  ui.Image? image;






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load("assets/icon/kaaba.png");
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    Get.find<CompassController>().checkPermission();


  }

 @override
  void dispose() {
    // TODO: implement dispose

   _animationController!.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Container(child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/logo.png",height: 50,),
            SizedBox(width: 10,),
            Text("Qibla",style: appBarTextStyle.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
          ],
        ))),
      ),
      body: GetBuilder<CompassController>(

        builder: (controller) {
          return !controller.isLoading?Scaffold(
          backgroundColor:compassPrimaryColor,
          body: StreamBuilder(
              stream: FlutterCompass.events,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Text("Eror reading ");
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                direction=snapshot.data!.heading;
                if(direction==null){
                  return Text("Device does not have sensor");
                }
                animation = Tween(begin: begin, end: (direction! * (pi / 180) * -1)).animate(_animationController!);
                begin = (direction! * (pi / 180) * -1);
                _animationController!.forward(from: 0);
                print(headingDegree(direction!).toInt());
                print(controller.bearing.round());
                print("qibla direction${direction}");
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/image/qibla_bg_ss.jpg"
                        ),
                        fit:BoxFit.fitHeight
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Neumorphism(
                        margin: EdgeInsets.all(size.width*0.1),
                        padding: EdgeInsets.all(10),
                        child: AnimatedBuilder(
                          animation: animation!,
                          builder: (context, child) {
                            return Transform.rotate(
                             // angle: (direction! *(pi/180)*-1),
                              angle: animation!.value,
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: size,
                                    painter: CompassViewPainter(color: grayColor,qiblaPositon: controller.bearing),
                                  ),


                                  CompassDisplay(size: size,),
                                  Transform.rotate(
                                    angle: (controller.bearing * pi / 180),
                                    //angle: 0,
                                    child: Stack(
                                      children: [
                                        Container(

                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                ClipShadowPath(shadow: Shadow(
                                                    blurRadius: 1
                                                ), clipper: TrianglePainter(isReverse: false), child: Container(
                                                  /*child: Padding(
                                          padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
                                          child: Image.asset("assets/icon/kaaba.png",height: 5,),
                                        )*/
                                                  height: 80,
                                                  width: 50,
                                                  color: Colors.red,
                                                ),),

                                                ClipShadowPath(shadow: Shadow(
                                                    blurRadius: 1,
                                                    color: Colors.grey.shade900
                                                ), clipper: TrianglePainter(isReverse: true), child: Container(
                                                  height: 80,
                                                  width: 50,
                                                  color: Colors.grey,
                                                ),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: (size.height/2)-size.height*0.405,
                                            left:(size.width/2)-size.width*0.19,
                                            child: Image.asset("assets/icon/kaaba.png",height: 50,width: 50,))
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          }
                        ),
                      ),
                     //

                      /*Positioned(
                          top: size.height*0.2,
                          right: (size.width*0.5)-20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${headingDegree(direction!).toInt().toString().padLeft(3,"0")}°",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                              Text("${getDirection(direction!)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            ],
                          )),*/

                      Positioned(
                          top: size.height*0.086,
                          right: (size.width*0.5)-29,
                          child: Container(
                            child: Image.asset("assets/icon/star.png",height:50,color:isEqualToDegree(direction!,controller.bearing,controller.isVibration)? Colors.amberAccent:Colors.grey,),
                          )),

                      controller.locationAddress!=null?Positioned(
                          top: size.height-220,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 20,right: 20),
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.pin_drop,size: 30,color:greenColor,),
                                      SizedBox(width: 5,),
                                      Text("${controller.locationAddress}",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )):SizedBox(),

                    ],
                  ),
                );
              }
          ),
          ):Scaffold(
            backgroundColor:compassPrimaryColor,
            body: Container(
              child: Center(child: CircularProgressIndicator(color: greenColor,)),
            ),
          );

        }
      ),
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

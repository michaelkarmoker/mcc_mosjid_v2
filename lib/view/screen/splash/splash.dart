import 'package:qibla_finder/controller/auth_controller.dart';
import 'package:qibla_finder/util/dimensions.dart';
import 'package:qibla_finder/util/styles.dart';
import 'package:qibla_finder/view/screen/auth/signIn.dart';
import 'package:qibla_finder/view/screen/dashboard/dashboard_screen.dart';
import 'package:qibla_finder/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';


import 'package:get/get.dart';

import 'dart:async';





class SplashScreen extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<SplashScreen> {

 // GlobalKey<ScaffoldState> _globalKey = GlobalKey();
 // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  @override
  void initState() {
    super.initState();


    // bool _firstTime = true;
    // _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if(!_firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       duration: Duration(seconds: isNotConnected ? 6000 : 3),
    //       content: Text(
    //         isNotConnected ? 'no_connection'.tr : 'connected'.tr,
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if(!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   _firstTime = false;
    // });


 //   Get.find<SplashController>().initSharedData();
    _route();
  }

  @override
  Widget build(BuildContext context) {
   // _controller!.forward();
    return  Scaffold(

        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/bg.jpg"),
              fit: BoxFit.fitHeight
            )
          ),

          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  child: Image.asset("assets/image/logo.png",height: 100,width: 100,),
                  // Optional paramaters
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.elasticIn,
                ),
               SizedBox(height: 20,),
                Text("MCC MASJID SCARBOROUGH",style: robotoMedium.copyWith(color: Colors.white,fontSize: Dimensions.fontSizeLarge),)
              ],
            ),
          ),
        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
   // _controller!.dispose();
    super.dispose();
  }
  void _route() {


    Timer(Duration(seconds: 2), () async {
        Get.offAll(DashboardScreen(pageIndex: 0));
        
      

     // Get.to(SignIn(exitFromApp: true));



      // if (Get.find<AuthController>().isLoggedIn()) {
      //   await Get.find<WishListController>().getWishList(true, false);
      //
      //   Get.offNamed(RouteHelper.getLandingRoute());
      //
      //
      // } else {
      //   if (Get.find<SplashController>().showIntro()!) {
      //     /*Get.find<LocalizationController>().setLanguage(Locale(
      //             AppConstants.languages[0].languageCode,
      //             AppConstants.languages[0].countryCode,
      //           ));*/
      //     Get.offNamed(RouteHelper.getOnBoardingRoute());
      //     // Get.offNamed(RouteHelper.getLanguageRoute('splash'));
      //   } else {
      //     Get.offNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
      //   }
      //
      //
      // }});


  }
    );
}
}




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccs_masjid/controller/compass_controller.dart';
import 'package:mccs_masjid/controller/home_controller.dart';
import 'package:mccs_masjid/controller/prayer_controller.dart';
import 'package:mccs_masjid/util/dimensions.dart';
import 'package:mccs_masjid/util/styles.dart';
import 'package:mccs_masjid/view/base/custom_button.dart';
import 'package:mccs_masjid/view/base/custom_snackbar.dart';
import 'package:mccs_masjid/view/screen/dashboard/dashboard_screen.dart';
import 'package:mccs_masjid/view/screen/home/widgets/KhudbaWidgetList.dart';
import 'package:mccs_masjid/view/screen/home/widgets/OurServiceWidgetList.dart';
import 'package:mccs_masjid/view/screen/home/widgets/banner_view.dart';
import 'package:mccs_masjid/view/screen/home/widgets/compass_widget.dart';
import 'package:mccs_masjid/view/screen/home/widgets/donation_widget.dart';
import 'package:mccs_masjid/view/screen/home/widgets/prayer_time_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


import '../../../util/InternetCheck.dart';
import '../drawer/drawer.dart';


class HomeScreen extends StatefulWidget {



  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().getSlider();
    Get.find<HomeController>().getKhutbaList();
    Get.find<HomeController>().getServiceList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CompassController>().checkPermission();
      Get.find<PrayerController>().getPrayerTime(false);

    });
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController!.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerLayout(),
      appBar: AppBar(
        toolbarHeight: Get.width>500?80:50,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Container(child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/logo.png",height: 6.h,),
              SizedBox(width: 10,),
              Text("MCC MASJID SCARBOROUGH",style: appBarTextStyle.copyWith(fontSize: 12.sp,color: Colors.white),),
            ],
          ))),
        ),
      ),

      body: RefreshIndicator(
          onRefresh: () async {
        if(await InternetCheck.checkUserConnection()){
    print("yes");
    Get.find<CompassController>().checkPermission();
    Get.find<PrayerController>().getPrayerTime(true);
        }else{
    showCustomSnackBar("Connect your Internet",isError: false);
        }

          },
          child: GetBuilder<HomeController>(

              builder: (controller) {
                return Container(
                  width: Get.width,
                  decoration:BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/image/bg_parttern.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            BannerView(homeController: controller,),
                            // SizedBox(height: 10,),
                            PrayerTimeSliderWidget(),
                            SizedBox(height: 2.h,),

                            GetBuilder<CompassController>(

                                builder: (controller) {
                                  return !controller.isLoading?Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Qibla Direction",style: robotoMedium.copyWith(fontSize: 12.sp,),),
                                        SizedBox(height: 2.h,),
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/image/qibla_bg.png"
                                                ),
                                                fit:BoxFit.cover
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Container(
                                            width:Get.width,
                                            height: Get.height*0.30,
                                            decoration: BoxDecoration(

                                              color: Colors.white.withOpacity(0.3),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(

                                                    height: Get.height*0.40,
                                                    width:Get.width/2,
                                                    child: InkWell(
                                                        onTap: (){
                                                          Get.offAll(DashboardScreen(pageIndex: 1));
                                                        },
                                                        child: CompassWidgets(animationController: _animationController,size: new Size(Get.width/2, Get.height*0.30),))),
                                              ],
                                            ) ,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ):
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),

                                                width: Get.width,
                                                height: 5.h,
                                              ),
                                              SizedBox(height: 10,),
                                              Container(decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),

                                                width: Get.width,
                                                height: Get.height*0.30,
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                  ;
                                }
                            ),

                            SizedBox(height: 2.h,),
                            DonationWidget(),
                            SizedBox(height: 2.h,),
                            Padding(
                              padding:  EdgeInsets.all(2.h),
                              child: OurServiceWidgetList(serviceList:controller.serviceList!,),
                            ),
                            SizedBox(height: 2.h,),
                            KhudbaWidgetList(khudbahList: controller.khutbahList!),
                            SizedBox(height: 4.h,),



                          ],
                        )),
                  )
                );
              }
          )),
    );

  }


}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 90 || oldDelegate.minExtent != 90 || child != oldDelegate.child;
  }


}
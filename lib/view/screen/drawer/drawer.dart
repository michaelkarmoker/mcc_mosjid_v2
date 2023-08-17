

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccs_masjid/controller/home_controller.dart';
import 'package:mccs_masjid/util/app_constants.dart';
import 'package:mccs_masjid/view/screen/prayer_time_update_screen/prayer_time_update_screen.dart';
import 'package:mccs_masjid/view/screen/webViewPage/web_view_screen.dart';


import 'package:url_launcher/url_launcher.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../about_us/about_us.dart';
import '../auth/signIn.dart';
import '../become_volunteer/become_Volunteer_screen.dart';
import 'createDrawerHeader.dart';
import 'creeateDrawerBodyItem.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({Key? key}) : super(key: key);

  @override
  State<DrawerLayout> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerLayout> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        //key: drawerscaffoldkey,
        width: (Get.width/4)*3,
        child: Container(

          child: Stack(
            children: [
              Column(
                children: [
                  createDrawerHeader(context),
                  Expanded(
                    child: ListView(
                      children: [
                        Get.find<AuthController>().isLoggedIn()?
                        createDrawerBodyItem(
                            icon: Images.logout,
                            text: 'Member Logout',
                            onTap: (){
                              Navigator.pop(context);
                              Get.find<AuthController>().signOut();
                              Get.find<HomeController>().update();



                            }

                        ):createDrawerBodyItem(
                            icon: Images.login,
                            text: 'Member Login',
                            onTap: () =>{
                              Get.to(SignIn(exitFromApp: false,))

                            }

                        ),
                        Get.find<AuthController>().isLoggedIn()?createDrawerBodyItem(
                            icon: Images.upcoming_event,
                            text: 'Update Prayer Time',
                            onTap: () =>{
                              Get.to(PrayerTimeUpdateScreen())

                            }

                        ):SizedBox(),
                        createDrawerBodyItem(
                            icon: Images.donation,
                            text: 'Donation Now',
                            onTap: () =>{
                                Navigator.of(context).pop(),
                              Get.to(WebViewPage(url: AppConstants.donationLink, title: 'Donation',))
                            }

                        ),
                        createDrawerBodyItem(
                            icon: Images.volunteer,
                            text: 'Become our volunteer',
                            onTap: () =>{
                              Navigator.of(context).pop(),
                              Get.to(WebViewPage(url: AppConstants.volantiar, title: 'Become our volunteer',))
                            }

                        ),

                        createDrawerBodyItem(
                            icon: Images.contactUs,
                            text: 'Contact Us',
                            onTap: () =>{
                              Navigator.of(context).pop(),
                              Get.to(WebViewPage(url: AppConstants.contactList, title: 'Contact Us',))

                            }

                        ),
                        createDrawerBodyItem(
                            icon: Images.about,
                            text: 'About Us',
                            onTap: () =>{
                              Get.to(AboutUsScreen())

                            }

                        ),





                        SizedBox(height: 150,),

                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child:Container(
                    color: Color(0xffFAFAFA),
                    width: (Get.width/4)*3,
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                              onTap:(){
                                _launchURL("https://skitsbd.com/");
                              },
                              child: Image.asset("assets/icon/companyLogo.png",width: 100,height: 60,fit: BoxFit.contain,)),
                          Text("Application development by SK IT Solution",
                            textAlign: TextAlign.center,
                            style: robotoRegular.copyWith(color: Colors.black87,fontSize: 12),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ) )
            ],
          ),
        ),
      ),
    );
  }
  _launchURL(String url) async {

    final uri = Uri.parse(url);
    await launchUrl(uri,mode: LaunchMode.externalApplication);

/*if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }*/

  }
}

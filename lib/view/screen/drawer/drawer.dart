

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qibla_finder/util/app_constants.dart';
import 'package:qibla_finder/view/screen/webViewPage/web_view_screen.dart';


import 'package:url_launcher/url_launcher.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../about_us/about_us.dart';
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
              ListView(

                children: [
                  createDrawerHeader(context),


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
                        Get.to(BecomeVolunteerScreen())
                      }

                  ),
                  createDrawerBodyItem(
                      icon: Images.upcoming_event,
                      text: 'Upcoming Event',
                      onTap: () =>{


                      }

                  ),
                  createDrawerBodyItem(
                      icon: Images.contactUs,
                      text: 'Contact Us',
                      onTap: () =>{


                      }

                  ),
                  createDrawerBodyItem(
                      icon: Images.about,
                      text: 'About Us',
                      onTap: () =>{
                        Get.to(AboutUsScreen())

                      }

                  ),



                  SizedBox(height: 50,),

                ],
              ),
              Positioned(
                  bottom: 0,
                  child:Container(
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

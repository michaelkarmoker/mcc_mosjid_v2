import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccs_masjid/view/screen/dashboard/widget/bottom_nav_item.dart';


import '../../../util/images.dart';
import '../compass_screen/compass_screen.dart';
import '../drawer/drawer.dart';
import '../home/home_screen.dart';


class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  DashboardScreen({required this.pageIndex});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  bool isOpen=false;
  int _pageIndex = 0;
  List<Widget> _screens=[];
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  bool _canExit =  false;

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      HomeScreen(),
      CompassScreen()

    ];
   // Get.find<CartController>().getCartList(true);
    /*if(GetPlatform.isMobile) {
      NetworkInfo.checkConnectivity(_scaffoldKey.currentContext);
    }*/
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async {

        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {

          if(_canExit) {

            return true;
          }else {

            if(_drawerscaffoldkey.currentState!.isDrawerOpen){

              Navigator.pop(context);
              return Future.value(false);
            }else {
              /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Back Press Again To Exit',
                    style: TextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme
                    .of(context)
                    .accentColor,
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              ));
              _canExit = true;
              Timer(Duration(seconds: 2), () {
                _canExit = false;
              });*/
              return false;
            }
          }
        }
      },
      child: Scaffold(
        key: _drawerscaffoldkey,


        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: CircularNotchedRectangle(),

          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/image/bottom_bg.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: Container(
              color: Colors.black26.withOpacity(0.7),
              height: Get.width>500?70:60,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Row(children: [
                  BottomNavItem(iconData: Images.home, isSelected: _pageIndex == 0, onTap: () => _setPage(0),height: 20, title:"Home",),
                  BottomNavItem(iconData: Images.qibla, isSelected: _pageIndex == 1, onTap: () => _setPage(1),height: 20, title: "Qibla",),

                ]),
              ),
            ),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    /*pageIndex==4?Get.to(CartPage()):*/
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
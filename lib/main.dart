import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:qibla_finder/util/app_constants.dart';
import 'package:qibla_finder/view/screen/compass_screen/compass_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/get_di.dart';
import 'theme/light_theme.dart';
import 'view/screen/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context);

    return GetMaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme:light,
      home: SplashScreen(),
      defaultTransition: Transition.topLevel,
      transitionDuration: Duration(milliseconds: 500),


    );
  }
}



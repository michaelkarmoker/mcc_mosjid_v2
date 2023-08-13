

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
class AppConstants {
  static const String APP_NAME = 'MCC MASJID';

  static const int APP_VERSION = 1;

  //Api End Point
  static const String BASE_URL = 'https://mccsmasjid.org/';

  static const String END_URI = 'widget?';
  static const String GET_PRAYER_TIME_URI = 'get_prayer_time';
  static const String UPDATE_PRAYER_TIME_URI = 'update_prayer_time';







  static const String USER_TYPE = 'user_type';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String PRAYER_TIME = 'prayer_time';

  static const String USERID = 'user_id';
  static const String REGIONID = 'region_id';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';
  static const String IS_STUDENT = 'is_student';
  static const String USER_PHONE = 'user_phone';
  static const String USER_IMAGE = 'user_image';
  static const String STUDENT_ID = 'student_id';
  static const String STUDENT_MOBILE = 'student_mobile';

  static const String USER_ADDRESS = 'user_address';
  static const String USER_NAME = 'user_name';
  static const String USER_NAMEP = 'user_namep';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String TOPIC = 'all_zone_customer';
  static const String ZONE_ID = 'zoneId';








//donation link
  static const String donationLink = 'https://mccsmasjid.org/donateM.html';
  static const String volantiar = 'https://mccsmasjid.org/volunteerM.html';
  static const String contactList = 'https://mccsmasjid.org/contactUSM.html';
//internet status code =========
  static const int BADGETWAY = 502;
  static const int SUCCESS = 200;


  static void launchURL(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri,mode: LaunchMode.externalApplication);

    /*if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }*/
  }
  static void launchYouTube(
      {
        required String urls,
      }) async {
    String url() {
      if (Platform.isAndroid) {
        //var url = 'fb://facewebmodal/f?href=https://www.facebook.com/al.mamun.me12';
        return urls;

      } else {
        return 'youtube://'+urls;
      }
    }
       await launchUrl(Uri.parse(url()),mode: LaunchMode.externalApplication);
    /*if (await canLaunchUrl(Uri.parse(url()))) {
      await launchUrl(Uri.parse(url()),mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${url()}';
    }*/
  }
}

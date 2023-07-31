

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
class AppConstants {
  static const String APP_NAME = 'MCC MASJID';

  static const int APP_VERSION = 1;

  //Api End Point
  static const String BASE_URL = 'https://chat.jobcarebd.net/';
  static const String STUDENT_IMAGE_URL = 'https://jobcarebd.net/students_img/';
  static const String ADMIN_IMAGE_URL = 'https://jobcarebd.net/images/';
  static const String LOGIN_URI = 'api/user/login';
  static const String REGISTRATION_URI = 'api/user/register';
  static const String PROFILE_URI = 'api/user/profile';
  static const String MESSAGE_SENT_URI = 'api/message/create';
  static const String MESSAGE_LIST_URI = 'api/message/list';
  static const String NOTICE_LIST_URI = 'api/notice/list';
  static const String USER_LIST_URI = 'api/users';
  static const String STUDENT_LIST_URI = 'api/students';
  static const String STUDENT_SEARCH_LIST_URI = 'api/students/search';
  static const String STUDENT_BLOCK_URI = 'api/students/block';
  static const String STUDENT_UNBLOCK_URI = 'api/students/unblock';
  static const String STUDENT_BLOCK_LIST_URI = 'api/students/blocked';
  static const String NOTICE_CREATE = 'api/notices/create';
  static const String NOTICE_UPDATE = 'api/notices/update';
  static const String NOTICE_DELETE = 'api/notices/delete';






  static const String USER_TYPE = 'user_type';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
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
  static const String donationLink = 'https://checkout.stripe.com/c/pay/cs_live_a1d2Q5snAxzCqYBuV0jF69p2ktEiNYvHjWa7Ra7g21tgjCHMRZ7Ajrcs7V#fidkdWxOYHwnPyd1blppbHNgWjA0SG9HMzdBREZGbzA1ZF9daXdPcVRmMGgwMTAwanZrcmZPVEFdMGJ3bH80QktjU3BxUVNRVnJxY3Z3TE1hUE8xQEJ9ME11cTJRVEJ%2FPGNianJsYVNvYXdvNTVXfFxfbGBSZCcpJ3VpbGtuQH11anZgYUxhJz8nNmZ2NTZmNVNGNzxtN3ZiNTU0Jyknd2BjYHd3YHdKd2xibGsnPydtcXF1dj8qKmhmZnZoZHZvbGErandiKid4JSUl';

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

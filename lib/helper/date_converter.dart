
import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(dateTime);
  }

  static String dateToTimeOnly(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String dateToDateAndTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  static String dateTimeStringToDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy  hh:mm a').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime));
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime);
  }

  static String isoStringToDateTimeString(String dateTime) {
    return DateFormat('dd MMM yyyy  hh:mm a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }


  static String stringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(DateFormat('yyyy-MM-dd').parse(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(time));
  }

  static DateTime convertStringTimeToDate(String time) {
    return DateFormat('HH:mm').parse(time);
  }



  static DateTime stringTimeToDateTime(String time) {
    return DateFormat('HH:mm:ss').parse(time);
  }

  static String stringToStringTime(String dateTime) {
    DateTime inputDate = DateFormat('HH:mm:ss').parse(dateTime);
    return DateFormat('hh:mm a').format(inputDate);
  }
  static String print24(String time)
  {
    // Get hours
    String returnTime="";
    int h1 = int.parse(time[1]);
    int h2 = int.parse(time[0]);
    int hh = (h2 * 10 + h1 % 10);

    // If time is in "AM"
    if (time[5] == 'a')
    {
      if (hh == 12)
      {
        returnTime=returnTime+"00";
        for (int i = 2; i <= 4; i++){
          print(time[i]);
          returnTime=returnTime+time[i];
        }

      }
      else
      {
        for (int i = 0; i <= 4; i++)
          returnTime=returnTime+time[i];
      }
    }

    // If time is in "PM"
    else
    {
      if (hh == 12)
      {
       print("12");
       returnTime=returnTime+hh.toString();
        for (int i = 2; i <= 4; i++)
          returnTime=returnTime+time[i];
      }
      else
      {
        hh = hh + 12;
        print(hh);
        returnTime=returnTime+hh.toString();
        for (int i = 2; i <= 4; i++)
          returnTime=returnTime+time[i];
      }
    }
    return returnTime;
  }
}

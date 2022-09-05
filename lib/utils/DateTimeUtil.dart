import 'dart:collection';

import 'package:intl/intl.dart';

class DateTimeUtils{

  static DateTimeUtils? _instance;
  DateTimeUtils._();
  static DateTimeUtils get instance => _instance ??= DateTimeUtils._();

  static String yyyyMMddTHHmmss = "yyyy-MM-dd'T'HH:mm:ss";
  static String HHmmaMMMMdyyyy = "HH:mm a - MMMM d, yyyy";
  static String YYYYMMDDHHMM = "yyyy-MM-dd HH:mm";
  static String HHmm= "HH:mm";
  static String hhmma = "hh:mm aa";
  static String yyyyMMdd = "yyyy-MM-dd";
  static String DAY_MONTH_MMM = "EEE, MMM dd";
  static String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";
  static String ddMMyyyy = "dd-MM-yyyy";

  String getTodayDate(String format){
    return DateFormat(format).format(DateTime.now());
  }

  String convertDateFromOneFormatToAnother(
      {required String date,
        required String inputFormat,
        required String outputFormat}) {
    return DateFormat(outputFormat)
        .format(DateFormat(inputFormat).parse(date.toString()))
        .toString();
  }

  int convertDateToTimeStamp({required String date, required String format}) {
    try {
      return DateFormat(format).parse(date.toString()).millisecondsSinceEpoch;
    } on Exception catch (error) {
      return 0;
    }
  }

  int currentTimeInMills() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  double? getHoursByMilliseconds(int milliseconds) {
    return ((milliseconds / (1000*60*60)) % 24);
  }

  double? getHoursByMinutes(int? hours) {
    try {
      if(hours == null) {
        return null;
      } else {
        return hours / 60;
      }
    } on Exception catch (error) {
      return null;
    }
  }

  int? getTodayMidnightDateInMills() {
    try {
      var now = DateTime.now();
      var lastMidnight = DateTime(now.year, now.month, now.day);
      return lastMidnight.millisecondsSinceEpoch;
    } on Exception catch (error) {
      return null;
    }
  }


  DateTime? getTodayMidnightDate() {
    try {
      var now = DateTime.now();
      var lastMidnight = DateTime(now.year, now.month, now.day);
      return lastMidnight;
    } on Exception catch (error) {
      return null;
    }
  }

  int? addDaysHoursMinutesSecondsInTodayMidnight({int? days, int? hours, int? minutes, int? seconds}) {
    try {
      DateTime? todayMidnightDate = getTodayMidnightDate();
      if (todayMidnightDate == null) {
        return null;
      } else {
        todayMidnightDate =
            todayMidnightDate.add(Duration(days: days ?? 0, hours: hours ?? 0, minutes: minutes ?? 0, seconds: seconds ?? 0));
        return todayMidnightDate.millisecondsSinceEpoch;
      }
    } on Exception catch (error) {
      return null;
    }
  }
}
/**
 * result = {HashMap@17726}  size = 5
    "DATE" -> "2022-08-26"
    "START_TIME" -> "15:15"
    "END_TIME" -> "17:15"
    "END_DATE" -> "2022-08-26"
    "DURATION" -> "2 hrs"
 */

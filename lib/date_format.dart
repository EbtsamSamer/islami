import 'models/prayer_rersponse_model.dart';
import 'package:intl/intl.dart';
class DateFormatter {
  static String fromGregorianDate(Gregorian gregorianDate) {
    return "${gregorianDate.day} ${gregorianDate.month!.en!.substring(0, 3)}\n ${gregorianDate.year}";
  }
  static String fromHijriDate(Hijri hijriDate) {
    return "${hijriDate.day} ${hijriDate.month!.en!.substring(0, 3)}\n ${hijriDate.year}";
  }
}
class TimeConverter {
  static String to12Hour(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    String time12Hour = DateFormat("hh:mm a").format(dateTime);
    return time12Hour;
  }
}


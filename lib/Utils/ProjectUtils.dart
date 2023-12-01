import 'package:intl/intl.dart';

class ProjectUtils{

  ProjectUtils();

  static DateTime convertDateTimeToString(String date){
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.parseStrict(date);
  }

  static int convertUsinEphoch(String? dateString) {
    if(dateString != "" && dateString != null){
      return DateFormat('dd-MM-yyyy').parse(dateString.replaceAll('/', '-')).millisecondsSinceEpoch ~/ 1000;
    }
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;

  }

  static DateTime intToDateTime(int timestamp){
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static String dateTimeToString(DateTime dateTime){
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

}


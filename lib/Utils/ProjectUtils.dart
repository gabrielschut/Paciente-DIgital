import 'package:intl/intl.dart';

class ProjectUtils{

  ProjectUtils();

  static DateTime convertDateTimeToString(String date){
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.parseStrict(date);
  }

  static int convertUsinEphoch(String dateString) {
    //todo: formatar as strings de 01/01/2024 para 01-01-2024
    DateTime date = DateFormat('dd-MM-yyyy').parse(dateString.replaceAll('/', '-'));
    return date.millisecondsSinceEpoch ~/ 1000;
  }

  static DateTime intToDateTime(int timestamp){
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static String dateTimeToString(DateTime dateTime){
    return DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  }

}


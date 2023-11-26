import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectUtils{

  ProjectUtils();

  static DateTime convertStringToDateTime(String date){
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.parseStrict(date);
  }

}


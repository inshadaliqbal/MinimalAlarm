import 'package:flutter/cupertino.dart';

class Days{
  String day;
  bool daySelect;
  Days({required this.day, this.daySelect = false});

  void selectDay(){
    daySelect = !daySelect;
  }
}
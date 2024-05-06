import 'package:flutter/cupertino.dart';

class Days{
  String day;
  bool daySelect = false;
  Days({required this.day,required this.daySelect});

  void selectDay(){
    daySelect = !daySelect!;
  }
}
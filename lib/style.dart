import 'package:flutter/material.dart';

BoxDecoration AnalogClockDecoration() {
  return BoxDecoration(
      // border: Border.all(
      //   width: 10.0,
      //   color: Colors.white70,
      // ),
      borderRadius: BorderRadius.circular(200),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],);
}

BoxDecoration AlarmCardDecoration() {
  return BoxDecoration(
    // boxShadow: [
    //   const BoxShadow(
    //       color: Colors.black38, spreadRadius: .5, blurRadius: 0.5)
    // ],
    borderRadius: BorderRadius.circular(20),
    color: Color(0xFFBAD8EB),
  );
}

ButtonStyle KAlarmSetDayButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all(const Size(30, 30)),
  padding: MaterialStateProperty.all(EdgeInsets.zero), // Set padding to zero
);

final kAlarmSetSaveButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(100, 50),
  backgroundColor: Colors.black38,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);

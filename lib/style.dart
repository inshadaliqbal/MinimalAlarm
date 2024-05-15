import 'package:flutter/material.dart';

BoxDecoration AnalogClockDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(200),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: -2,
        blurRadius: 5,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}

BoxDecoration AlarmCardDecoration() {
  return BoxDecoration(
    // boxShadow: [
    //   const BoxShadow(
    //       color: Colors.black38, spreadRadius: .5, blurRadius: 0.5)
    // ],
    borderRadius: BorderRadius.circular(20),
    color: Color(0xFF8FEADD),
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

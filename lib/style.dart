import 'package:flutter/material.dart';

BoxDecoration AnalogClockDecoration() {
  return BoxDecoration(
      border: Border.all(
        width: 10.0,
        color: Colors.white70,
      ),
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        const BoxShadow(
            color: Colors.white10, spreadRadius: 1.0, blurRadius: 20.0)
      ]);
}


BoxDecoration AlarmCardDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Colors.white);
}

ButtonStyle KAlarmSetDayButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all(const Size(30, 30)),
  padding: MaterialStateProperty.all(
      EdgeInsets.zero), // Set padding to zero
);

final kAlarmSetSaveButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(100, 50),
  backgroundColor: Colors.black38,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
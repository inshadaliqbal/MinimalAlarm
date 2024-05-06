import 'package:flutter/material.dart';

TextStyle kDayTextStyle(List<dynamic> dayList, int i) {
    return TextStyle(
        fontSize: 20.0,
        fontWeight:
        dayList[i].daySelect == true ? FontWeight.w600 : FontWeight.w200,
    );
}

const kAlarmSetSaveButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white);

const kAlarmSetVibrateTitle = TextStyle(
    fontSize: 18,
);

const kAlarmSetSoundTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
);

const kAlarmSetSound = TextStyle(
    fontSize: 18,
    color: Colors.black,
);

const kAlarmSetRepeat = TextStyle(
    fontSize: 18,
    color: Colors.black,
);

const kAlarmSetLabel = TextStyle(
    fontSize: 18,
    color: Colors.black,
);

const kAlarmSetHourMin = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
);

const kAlarmSetTitle = TextStyle(fontSize: 20, color: Colors.black);

const kAlarmCardTitle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 2);

const kAlarmTimeStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200);

const List<String> daysInWeek = ['S','M','T','W','T','F','S'];

const kDigitalClockText = TextStyle(fontSize: 30, fontWeight: FontWeight.w200);
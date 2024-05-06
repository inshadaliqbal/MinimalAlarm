import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:malarm/alarm_ring_page.dart';
import 'alarm_card_class.dart';
import 'dayclass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:alarm/alarm.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';

class MainEngine extends ChangeNotifier {
  MainEngine() {
    Alarm.init();
  }

  bool? status;

  void permissionGranted(PermissionStatus granted) {
    status = granted.isGranted;
    notifyListeners();
  }

  List<AlarmCardClass> alarmCardList = [
    AlarmCardClass(
        alarmTitle: 'New Alarm',
        daysList: [
          Days(day: 'Sunday'),
          Days(day: 'Monday'),
          Days(day: 'Tuesday'),
          Days(day: 'Wednesday'),
          Days(day: 'Thursday'),
          Days(day: 'Friday'),
          Days(day: 'Saturday')
        ],
        hourSelected: 10,
        minuteSelected: 00,
        zoneSelected: 'AM',
        isActive: true,
        vibrateActive: true,
        fileSelectedPath: ''),
  ];

  int getListLength() {
    return alarmCardList.length;
  }

  void addAlarmCard(
      BuildContext context,
      int whereInt,
      String alarmTitle,
      int hourSelected,
      int minuteSelected,
      List daysList,
      String zoneSelected,
      bool isActive,
      bool vibrateActive,
      String fileSelectedPath) {
    alarmCardList.insert(
      whereInt,
      AlarmCardClass(
          alarmTitle: alarmTitle,
          daysList: daysList,
          hourSelected: hourSelected,
          minuteSelected: minuteSelected,
          zoneSelected: zoneSelected,
          isActive: isActive,
          vibrateActive: vibrateActive,
          fileSelectedPath: fileSelectedPath),
    );
    notifyListeners();
    alarmEngine(context);
  }

  void onChangedFunction(BuildContext context, int index) {
    alarmCardList[index].isActiveSwitch();
    notifyListeners();
    alarmEngine(context);
  }

  AlarmCardClass listForAlarmEdit(int? indexInt) {
    return alarmCardList[indexInt!];
  }

  void deleteAlarm(int indexDelete) {
    alarmCardList.removeAt(indexDelete);
    notifyListeners();
  }

  List<Future<bool>> alarmList = [];

  void alarmEngine(BuildContext context) async {
    for (int i = 0; i < alarmCardList.length; i++) {
      int hourConverted;
      if (alarmCardList[i].zoneSelected == 'AM' &&
          alarmCardList[i].hourSelected == 12) {
        hourConverted = 0;
        print(1);
      } else if (alarmCardList[i].zoneSelected == 'PM' &&
          alarmCardList[i].hourSelected == 12) {
        hourConverted = 12;
        print(2);
      } else if (alarmCardList[i].zoneSelected == 'PM') {
        hourConverted = alarmCardList[i].hourSelected + 12;
        print(3);
      } else {
        hourConverted = alarmCardList[i].hourSelected;
        print(4);
      }
      if (alarmCardList[i].isActive!) {
        final alarmSettings = await AlarmSettings(
            id: i,
            dateTime: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                hourConverted,
                alarmCardList[i].minuteSelected,
                0,
                0,
                0),
            assetAudioPath: 'assets/real.wav',
            loopAudio: true,
            vibrate: true,
            fadeDuration: 3.0,
            notificationTitle: 'This is the title',
            notificationBody: 'This is the body',
            enableNotificationOnKill: true,
            androidFullScreenIntent: true);
        alarmList.add(Alarm.set(alarmSettings: alarmSettings));
        Alarm.ringStream.stream.listen(
          (_) => navigatorKey.currentState!.pushNamed(AlarmRingPage.ringPage),
        );
      } else {
        Alarm.stop(i);
      }
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:malarm/alarm_ring_page.dart';
import 'package:periodic_alarm/model/alarms_model.dart';
import 'alarm_card_class.dart';
import 'dayclass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dayclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:periodic_alarm/periodic_alarm.dart';

import 'main.dart';

class MainEngine extends ChangeNotifier {
  MainEngine() {
    PeriodicAlarm.init();
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
          Days(day: 'Sunday', daySelect: false),
          Days(day: 'Monday', daySelect: false),
          Days(day: 'Tuesday', daySelect: false),
          Days(day: 'Wednesday', daySelect: false),
          Days(day: 'Thursday', daySelect: false),
          Days(day: 'Friday', daySelect: false),
          Days(day: 'Saturday', daySelect: false)
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
    alarmEngine(context);
    notifyListeners();
  }

  void onChangedFunction(BuildContext context, int index) {
    alarmCardList[index].isActiveSwitch();
    alarmEngine(context);
    notifyListeners();
  }

  AlarmCardClass listForAlarmEdit(int? indexInt) {
    return alarmCardList[indexInt!];
  }

  void deleteAlarm(int indexDelete, BuildContext context) {
    alarmCardList.removeAt(indexDelete);
    alarmEngine(context);
    notifyListeners();
  }

  List<Future<bool>> alarmList = [];

  void alarmEngine(BuildContext context) {
    for (int i = 0; i < alarmCardList.length; i++) {
      int hourConverted;
      if (alarmCardList[i].zoneSelected == 'AM' &&
          alarmCardList[i].hourSelected == 12) {
        hourConverted = 0;
      } else if (alarmCardList[i].zoneSelected == 'PM' &&
          alarmCardList[i].hourSelected == 12) {
        hourConverted = 12;
      } else if (alarmCardList[i].zoneSelected == 'PM') {
        hourConverted = alarmCardList[i].hourSelected + 12;
      } else {
        hourConverted = alarmCardList[i].hourSelected;
      }

      alarmDayWiseAdding(hourConverted, i);
      PeriodicAlarm.ringStream.stream.listen((_) => navigatorKey.currentState!.pushNamed(AlarmRingPage.ringPage),
      );
    }
  }

  void alarmDayWiseAdding(int hourSelected, int i) {
    for (AlarmCardClass alarmCard in alarmCardList) {
      final alarmSettings = AlarmModel(
        id: i,
        dateTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            hourSelected,
            alarmCard.minuteSelected,
            0,
            0,
            0),
        assetAudioPath: 'assets/real.wav',
        loopAudio: true,
        fadeDuration: 3.0,
        notificationTitle: 'This is the title',
        notificationBody: 'This is the body',
        enableNotificationOnKill: true,
        monday: alarmCard.daysList![1].daySelect,
        tuesday: alarmCard.daysList![2].daySelect,
        wednesday: alarmCard.daysList![3].daySelect,
        thursday: alarmCard.daysList![4].daySelect,
        friday: alarmCard.daysList![5].daySelect,
        saturday: alarmCard.daysList![6].daySelect,
        sunday: alarmCard.daysList![0].daySelect,
        active: true,
      );
      PeriodicAlarm.setOneAlarm(alarmModel: alarmSettings);
    }
  }
}

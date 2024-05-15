import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:malarm/alarm_card_class.dart';
import 'package:malarm/constants.dart';
import 'package:provider/provider.dart';
import 'dayclass.dart';
import 'provider_engine.dart';
import 'functions.dart';
import 'buttons.dart';
import 'widgets.dart';
import 'style.dart';

class AlarmSet extends StatefulWidget {
  static const String alarmSet = 'AlarmSet';
  List<Days> dayRepeat = [
    Days(day: 'Sunday',daySelect: false),
    Days(day: 'Monday',daySelect: false),
    Days(day: 'Tuesday',daySelect: false),
    Days(day: 'Wednesday',daySelect: false),
    Days(day: 'Thursday',daySelect: false),
    Days(day: 'Friday',daySelect: false),
    Days(day: 'Saturday',daySelect: false),
  ];
  int currentIndex;
  AlarmCardClass alarmCardClass = AlarmCardClass(
    alarmTitle: 'New Alarm',
    daysList: [
      Days(day: 'Sunday',daySelect: false),
      Days(day: 'Monday',daySelect: false),
      Days(day: 'Tuesday',daySelect: false),
      Days(day: 'Wednesday',daySelect: false),
      Days(day: 'Thursday',daySelect: false),
      Days(day: 'Friday',daySelect: false),
      Days(day: 'Saturday',daySelect: false)
    ],
    hourSelected: 9,
    minuteSelected: 35,
    zoneSelected: 'Am',
    isActive: true,
    vibrateActive: true,
    fileSelectedPath: '',
  );
  AlarmSet({required this.alarmCardClass, required this.currentIndex});

  @override
  State<AlarmSet> createState() => _AlarmSetState();
}

class _AlarmSetState extends State<AlarmSet> {
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MainEngine();
      },
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: const Row(
                  children: [
                    AlarmSetBackButton(),
                    Padding(
                      padding: EdgeInsets.only(left: 105.0),
                      child: Text(
                        'Add Alarm',
                        style: kAlarmSetTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  DialWidgetAlarmSet(
                    minuteSetFunction: (value) {
                      setState(() {
                        widget.alarmCardClass.minuteSelected = value;
                      });
                    },
                    hourSetFunction: (int value) {
                      setState(() {
                        widget.alarmCardClass.hourSelected = value;
                      });
                    },
                    zonePickFunction: (value) {
                      List<String> zoneListSelect = ['AM', 'PM'];
                      widget.alarmCardClass.zoneSelected =
                          zoneListSelect[value];
                      print(widget.alarmCardClass.zoneSelected);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        '${widget.alarmCardClass.hourSelected} : ${widget.alarmCardClass.minuteSelected}',
                        textAlign: TextAlign.center,
                        style: kAlarmSetHourMin),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Label',
                            textAlign: TextAlign.start, style: kAlarmSetLabel),
                        Container(
                          height: 20.00,
                          width: 150.00,
                          child: TextField(
                            onChanged: (value) {
                              widget.alarmCardClass.alarmTitle = value;
                            },
                            decoration: InputDecoration(

                              hintText: widget.alarmCardClass.alarmTitle
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Repeat',
                        textAlign: TextAlign.start, style: kAlarmSetRepeat),
                    const SizedBox(
                      height: 5,
                    ),
                    AlarmSetDayListRow(
                        widget: widget,
                        days: days,
                        buttonFunction: (int i) {
                          setState(() {
                            widget.alarmCardClass.daysList![i].selectDay();
                            print(widget.alarmCardClass.daysList![i].daySelect);
                          });
                        }),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sound',
                      textAlign: TextAlign.start,
                      style: kAlarmSetSound,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilePickerButton(
                            title: widget,
                            buttonFunction: () async {
                              // widget.alarmCardClass.fileSelectedPath =
                              //     await alarmSetFilePicker(context);
                            }),
                        AlarmSetSlider(
                          sliderFunction: () {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AlarmSetVibrateButton(
                  widget: widget,
                  buttonFunction: (value) {
                    setState(() {
                      widget.alarmCardClass.vibrateActive = value;
                    });
                  }),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          AlarmSetSaveButtonFunction(context, widget);
                          Navigator.pop(context);
                          Provider.of<MainEngine>(context,listen: false).alarmEngine(context);
                        },
                        child: Text(
                          'Save',
                          style: kAlarmSetSaveButton,
                        ),
                        style: kAlarmSetSaveButtonStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:malarm/provider_engine.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'alarmsetpage.dart';
import 'style.dart';
import 'imported_widget.dart';
import 'package:flutter/cupertino.dart';

class AlarmCard extends StatelessWidget {
  String alarmTitle;
  int hourSelected;
  int minuteSelected;
  List daysList;
  String zoneSelected;
  bool isActiveValue;
  Function onChangedFunction;
  int currentListInt;

  AlarmCard(
      {required this.alarmTitle,
      required this.daysList,
      required this.hourSelected,
      required this.minuteSelected,
      required this.zoneSelected,
      required this.isActiveValue,
      required this.onChangedFunction,
      required this.currentListInt});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        MainEngine();
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlarmSet(
                      alarmCardClass: Provider.of<MainEngine>(context)
                          .listForAlarmEdit(currentListInt),
                      currentIndex: currentListInt,
                    )),
          );
        },
        onLongPress: () {
          Provider.of<MainEngine>(context, listen: false)
              .deleteAlarm(currentListInt);
        },
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(15),
          decoration: AlarmCardDecoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$alarmTitle',
                      style: kAlarmCardTitle,
                    ),
                    AlarmCardMainButton(
                        isActiveValue: isActiveValue,
                        onChangedFunction: onChangedFunction),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$hourSelected:$minuteSelected $zoneSelected',
                    style: kAlarmTimeStyle,
                  ),
                  Text(
                    '6 Hours, 55 Minutes left',
                    style: kAlarmTimeStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: dayWidgetListMethod(daysList),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Text> dayWidgetListMethod(List dayList) {
  List<Text> dayWidgetList = [];
  List<String> daysInWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  for (int i = 0; i < daysInWeek.length; i++) {
    dayWidgetList.add(
      Text(
        daysInWeek[i],
        style: kDayTextStyle(dayList, i),
      ),
    );
  }
  return dayWidgetList;
}

class MainListViewBuilder extends StatelessWidget {
  const MainListViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainEngine>(
      builder: (context, mainEngine, _) {

        return Container(
          height: 300,
          child: ListView.builder(
            itemCount: Provider.of<MainEngine>(context,listen: true).getListLength(),
            itemBuilder: (context, index) {
              print(mainEngine.getListLength());
              return AlarmCard(
                onChangedFunction: () {
                  mainEngine.onChangedFunction(context,index);
                },
                currentListInt: index,
                isActiveValue: mainEngine.alarmCardList[index].isActive!,
                alarmTitle: mainEngine.alarmCardList[index].alarmTitle!,
                daysList: mainEngine.alarmCardList[index].daysList!,
                hourSelected: mainEngine.alarmCardList[index].hourSelected!,
                minuteSelected: mainEngine.alarmCardList[index].minuteSelected!,
                zoneSelected: mainEngine.alarmCardList[index].zoneSelected,
              );
            },
          ),
        );
      },
    );
  }
}

class DialWidgetAlarmSet extends StatelessWidget {
  DialWidgetAlarmSet({
    super.key,
    required this.minuteSetFunction,
    required this.hourSetFunction,
    required this.zonePickFunction,
  });

  Function minuteSetFunction;
  Function hourSetFunction;
  Function zonePickFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: RotatableDial1(
            minuteSetFunction,
          ),
        ),
        Center(
          child: RotatableDial(hourSetFunction),
        ),
        Container(
          height: 60,
          width: 70,
          child: CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (value){
              zonePickFunction(value);
            }
            ,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('AM'),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text('PM'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AlarmSetDayListRow extends StatelessWidget {
  AlarmSetDayListRow({
    super.key,
    required this.widget,
    required this.days,
    required this.buttonFunction,
  });

  Function buttonFunction;
  final List<String> days;
  final AlarmSet widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 7; i++)
          TextButton(
            onPressed: () {
              buttonFunction(i);
            },
            style: KAlarmSetDayButtonStyle,
            child: Text(
              days[i],
              style: TextStyle(
                  fontSize:
                      widget.alarmCardClass.daysList![i].daySelect == false
                          ? 14
                          : 20,
                  color: Colors.black),
            ),
          ),
      ],
    );
  }
}

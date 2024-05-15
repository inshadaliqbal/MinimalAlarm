import 'package:flutter/material.dart';
import 'package:malarm/alarm_ring_page.dart';
import 'package:malarm/constants.dart';
import 'package:malarm/functions.dart';
import 'package:malarm/provider_engine.dart';
import 'package:malarm/style.dart';
import 'package:malarm/welcomepage.dart';
import 'package:provider/provider.dart';
import 'alarmsetpage.dart';
import 'package:flutter/cupertino.dart';

class FAButton extends StatelessWidget {
  const FAButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF6DE6C2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        Navigator.pushNamed(context, AlarmSet.alarmSet);
        // Navigator.pushNamed(context, AlarmRingPage.ringPage);
      },
    );
  }
}

class AlarmCardMainButton extends StatelessWidget {
  const AlarmCardMainButton({
    super.key,
    required this.isActiveValue,
    required this.onChangedFunction,
  });

  final bool isActiveValue;
  final Function onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      trackColor: Colors.white38,
      thumbColor: Colors.blueGrey,
      activeColor: Colors.white,
        value: isActiveValue,
        onChanged: (bool newValue) {
          onChangedFunction();
          Provider.of<MainEngine>(context,listen: false).stopAlarm();
        });
  }
}

class AlarmSetBackButton extends StatelessWidget {
  const AlarmSetBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(10, 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
    );
  }
}

class FilePickerButton extends StatelessWidget {
  FilePickerButton({
    super.key,
    required this.title,
    required this.buttonFunction,
  });

  AlarmSet title;
  Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(title.alarmCardClass.fileSelectedPath,
          style: kAlarmSetSoundTitle),
      onPressed: ()async{
        title.alarmCardClass.fileSelectedPath =
            await alarmSetFilePicker(context);
      },
    );
  }
}

class AlarmSetSlider extends StatelessWidget {
  AlarmSetSlider({super.key, required this.sliderFunction});

  final Function sliderFunction;

  @override
  Widget build(BuildContext context) {
    double value1 = 100;
    return Row(
      children: [
        const Icon(
          Icons.volume_down,
          color: Colors.black,
        ),
        Slider(
          inactiveColor: Colors.black38,
          thumbColor: Colors.black54,
          value: value1,
          min: 10.0,
          max: 100.0,
          onChanged: (double newValue) {
            value1 = newValue;
            sliderFunction();
          },
        ),
      ],
    );
  }
}

class AlarmSetVibrateButton extends StatelessWidget {
  const AlarmSetVibrateButton({
    super.key,
    required this.widget,
    required this.buttonFunction,
  });

  final AlarmSet widget;
  final Function buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Vibrate',
            style: kAlarmSetVibrateTitle,
          ),
          CupertinoSwitch(
              value: widget.alarmCardClass.vibrateActive,
              onChanged: (value) {
                buttonFunction(value);
              }),
        ],
      ),
    );
  }
}

class AlarmSetSaveButton extends StatelessWidget {
  Function alarmSetSaveButtonCall;
  AlarmSetSaveButton({super.key, required this.alarmSetSaveButtonCall});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: alarmSetSaveButtonCall(),
              child: Text(
                'Save',
                style: kAlarmSetSaveButton,
              ),
              style: kAlarmSetSaveButtonStyle),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malarm/constants.dart';
import 'package:alarm/alarm.dart';
import 'buttons.dart';
import 'widgets.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'imported_widget.dart';

class Malarm extends StatelessWidget {
  static const String malarm = 'welcome_screen';
  const Malarm({super.key});


  @override
  Widget build(BuildContext context) {
    Alarm.init();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFC8FFFD),
        title: Center(
          child: Text(
            'Minimal Alarm',
            style:
                TextStyle(fontFamily: 'Josefin',fontSize: 30, color: Colors.black, letterSpacing: 1,fontWeight: FontWeight.w400),
          ),
        ),
      ),
      floatingActionButton: const FAButton(),
      backgroundColor: const Color(0xFFC8FFFD),
      body: Column(
        children: [
          const AnalogClockContainer(),
          DigitalClock(
            is24HourTimeFormat: false,
            hourMinuteDigitTextStyle: kDigitalClockText,
            secondDigitTextStyle: kDigitalClockText,
          ),
          Expanded(child: MainListViewBuilder()),
        ],
      ),
    );
  }
}

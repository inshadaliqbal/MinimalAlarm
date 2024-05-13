import 'package:flutter/material.dart';
import 'package:malarm/constants.dart';
import 'package:malarm/provider_engine.dart';
import 'package:provider/provider.dart';
import 'buttons.dart';
import 'widgets.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'imported_widget.dart';

class Malarm extends StatelessWidget {
  static const String malarm = 'welcome_screen';
  const Malarm({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFDCECF5),
        title: Center(
          child: Text(
            'Alarm',
            style:
                TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 2),
          ),
        ),
      ),
      floatingActionButton: const FAButton(),
      backgroundColor: const Color(0xFFFDCECF5),
      body: Column(
        children: [
          const AnalogClockContainer(),
          DigitalClock(
            hourMinuteDigitTextStyle: kDigitalClockText,
            secondDigitTextStyle: kDigitalClockText,
          ),
          MainListViewBuilder(),
        ],
      ),
    );
  }
}

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
      floatingActionButton: const FAButton(),
      backgroundColor: const Color(0xFFEFEFF1),
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

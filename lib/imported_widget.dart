import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'style.dart';

class RotatableDial1 extends StatefulWidget {
  Function? selectMinuteValue;
  RotatableDial1(this.selectMinuteValue);

  @override
  _RotatableDial1State createState() => _RotatableDial1State();
}

class _RotatableDial1State extends State<RotatableDial1> {
  double dialRotation = 0.0;
  int selectedNumber = 0;
  final int totalNumbers = 60;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          double angle = math.atan2(
              details.localPosition.dy - 150, details.localPosition.dx - 150);
          dialRotation = (angle + math.pi / 2) % (2 * math.pi);
          // updateSelectedNumber();
          double adjustedRotation =
              (dialRotation - math.pi / 2) % (2 * math.pi);
          if (adjustedRotation < 0) {
            adjustedRotation += 2 * math.pi;
          }

          double angleUnit = (2 * math.pi) / totalNumbers;
          int index = ((adjustedRotation + angleUnit / 2) %
              (2 * math.pi) ~/
              angleUnit) %
              totalNumbers;
          setState(() {
            if((index + totalNumbers) % totalNumbers + 1 == 60){
              selectedNumber = 00;
            }else{
              selectedNumber = (index + totalNumbers) % totalNumbers + 1;
            }
          });
          widget.selectMinuteValue!(selectedNumber);
        });
      },
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFCFE9FC),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 20,
              child: Icon(
                Icons.arrow_circle_down,
                size: 20.0,
                color: Colors.black, // Change arrow color
              ),
            ),
            ...List.generate(totalNumbers, (index) {
              final double angle = -index * 2 * math.pi / totalNumbers;
              final double radius = 140.0;

              final double x = radius * math.cos(angle + dialRotation);
              final double y = radius * math.sin(angle + dialRotation);

              return Positioned(
                left: x + 140.0,
                top: y + 140.0,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: Center(
                    child: Text(
                      '${index + 1 == 60 ? index = 00 : index + 1}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black, // Change number text color
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
// //
// int updateSelectedNumber() {
//   double adjustedRotation = (dialRotation - math.pi / 2) % (2 * math.pi);
//   if (adjustedRotation < 0) {
//     adjustedRotation += 2 * math.pi;
//   }
//
//   double angleUnit = (2 * math.pi) / totalNumbers;
//   int index = ((adjustedRotation + angleUnit / 2) % (2 * math.pi) ~/ angleUnit) % totalNumbers;
//   setState(() {
//     selectedNumber = (index + totalNumbers) % totalNumbers + 1;
//   });
//   print(selectedNumber);
//   return selectedNumber;
// }
}

class RotatableDial extends StatefulWidget {
  Function? selectHourValue;
  RotatableDial(this.selectHourValue);
  @override
  _RotatableDialState createState() => _RotatableDialState();
}

class _RotatableDialState extends State<RotatableDial> {
  double dialRotation = 0.0;
  int selectedNumber = 0;
  final int totalNumbers = 12; // Change to 12 for 12 numbers

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          double angle = math.atan2(
              details.localPosition.dy - 150, details.localPosition.dx - 150);
          dialRotation = (angle + math.pi / 2) % (2 * math.pi);
          double adjustedRotation =
              (dialRotation - math.pi / 2) % (2 * math.pi);
          if (adjustedRotation < 0) {
            adjustedRotation += 2 * math.pi;
          }

          double angleUnit = (2 * math.pi) / totalNumbers;
          int index = ((adjustedRotation + angleUnit / 2) %
              (2 * math.pi) ~/
              angleUnit) %
              totalNumbers;
          setState(() {
            selectedNumber = (index + totalNumbers) % totalNumbers + 1;
          });
          widget.selectHourValue!(selectedNumber);
        });
      },
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFCFE9FC),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 25,
              child: Icon(
                Icons.arrow_circle_down,
                size: 20.0,
                color: Colors.black,
              ),
            ),
            ...List.generate(totalNumbers, (index) {
              final double angle = -index * 2 * math.pi / totalNumbers;
              final double radius = 85.0;

              final double x = radius * math.cos(angle + dialRotation);
              final double y = radius * math.sin(angle + dialRotation);

              return Positioned(
                left: x + 90.0,
                top: y + 90.0,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black, // Change number text color
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  int updateSelectedNumber() {
    print(selectedNumber);
    return selectedNumber;
  }
}

class AnalogClockContainer extends StatelessWidget {
  const AnalogClockContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
        decoration: AnalogClockDecoration(),
        child: const AnalogClock(
          hourHandLengthFactor: 0.8,
          hourHandWidthFactor: 0.5,
          minuteHandLengthFactor: 0.8,
          secondHandLengthFactor: 0.9,
          dialColor: Color(0xFFCFE9FC),
          markingColor: null,
          hourNumberColor: null,
          secondHandColor: Colors.redAccent,
        ),
      ),
    );
  }
}

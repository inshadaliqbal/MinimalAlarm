
import 'provider_engine.dart';
import 'package:flutter/material.dart';
import 'package:malarm/alarmsetpage.dart';
import 'package:provider/provider.dart';
import 'welcomepage.dart';
import 'alarm_card_class.dart';
import 'dayclass.dart';
import 'alarm_ring_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainEngine(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        initialRoute: Malarm.malarm,
        routes: {
          Malarm.malarm: (context) => Malarm(),
          AlarmSet.alarmSet: (context) => AlarmSet(
                alarmCardClass: AlarmCardClass(
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
                    hourSelected: 9,
                    minuteSelected: 35,
                    zoneSelected: 'Am',
                    isActive: true,
                    vibrateActive: true,
                    fileSelectedPath: ''
                ),
                currentIndex:
                    Provider.of<MainEngine>(context).getListLength() + 1,
              ),
          AlarmRingPage.ringPage: (context)=> AlarmRingPage(title: 'HAI',functionForClose: (){},functionForSnooze: (){},),
        },
      ),
    ),
  );
}
//
// void main() async {
//   runApp(MaterialApp(
//     home: NewWidget(),
//   ));
// }
//
// class NewWidget extends StatefulWidget {
//   const NewWidget({
//     super.key,
//   });
//
//   @override
//   State<NewWidget> createState() => _NewWidgetState();
// }
//
// class _NewWidgetState extends State<NewWidget> {
//   @override
//   void initState() {
//     super.initState();
//     // TODO: implement initState
//     Alarm.init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           child: Text('Alarm'),
//           onPressed: () async {
//             await Alarm.set(alarmSettings: alarmSettings);
//             Alarm.ringStream.stream
//                 .listen((_) => yourOnRingCallback(context));
//           },
//         ),
//       ),
//     );
//   }
// }
//
// void yourOnRingCallback(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => AlarmSet(
//         alarmCardClass: AlarmCardClass(
//             alarmTitle: 'New Alarm',
//             daysList: [
//               Days(day: 'Sunday'),
//               Days(day: 'Monday'),
//               Days(day: 'Tuesday'),
//               Days(day: 'Wednesday'),
//               Days(day: 'Thursday'),
//               Days(day: 'Friday'),
//               Days(day: 'Saturday')
//             ],
//             hourSelected: 12,
//             minuteSelected: 00,
//             zoneSelected: 'Am',
//             isActive: true,
//             vibrateActive: true,
//             fileSelectedPath: ''),
//         currentIndex: Provider.of<MainEngine>(context).getListLength() + 1,
//       ),
//     ),
//   );
// }
//
// final alarmSettings = AlarmSettings(
//     id: 42,
//     dateTime: DateTime(2024, 5, 2, 13, 37, 0, 0, 0),
//     assetAudioPath: 'assets/real.wav',
//     loopAudio: true,
//     vibrate: true,
//     fadeDuration: 3.0,
//     notificationTitle: 'This is the title',
//     notificationBody: 'This is the body',
//     enableNotificationOnKill: true,
//     androidFullScreenIntent: true);

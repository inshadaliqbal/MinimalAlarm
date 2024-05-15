import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';
import 'provider_engine.dart';

class AlarmRingPage extends StatelessWidget {
  static const String ringPage = 'alarm_ring_page';
  String title;
  int? alarmHour;
  int? alarmMinute;
  String? alarmZone;
  Function functionForSnooze;
  Function functionForClose;

  AlarmRingPage(
      {required this.title,
      required this.alarmHour,
      required this.alarmMinute,
      required this.alarmZone,
      required this.functionForSnooze,
      required this.functionForClose,
      super.key});

  @override
  Widget build(BuildContext context) {
    var _value;
    return ChangeNotifierProvider(
      create: (context) => MainEngine(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgimage.jpg'), fit: BoxFit.fill),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 250, horizontal: 40),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${title}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '${alarmHour!} : ${alarmMinute!} ${alarmZone!}',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                functionForClose;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.black],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: SwipeActionCell(
                                backgroundColor: Colors.transparent,

                                /// this key is necessary
                                key: ObjectKey('list[index]'),
                                trailingActions: <SwipeAction>[
                                  SwipeAction(
                                    color: Colors.transparent,
                                    performsFirstActionWithFullSwipe: true,
                                    onTap: (CompletionHandler handler) async {
                                      functionForSnooze;
                                      Navigator.pop(context);
                                      Provider.of<MainEngine>(context,
                                              listen: false)
                                          .stopAlarm();
                                    },
                                  ),
                                ],
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_back_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        "Snooze",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Icon(
                                          Icons.alarm,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Future<void> RingPageNavigator() async => Alert(
//     context: context,
//     title: "LOGIN",
//     content: Column(
//       children: <Widget>[
//         TextField(
//           decoration: InputDecoration(
//             icon: Icon(Icons.account_circle),
//             labelText: 'Username',
//           ),
//         ),
//         TextField(
//           obscureText: true,
//           decoration: InputDecoration(
//             icon: Icon(Icons.lock),
//             labelText: 'Password',
//           ),
//         ),
//       ],
//     ),
//     buttons: [
//       DialogButton(
//         onPressed: () => Navigator.pop(context),
//         child: Text(
//           "LOGIN",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       )
//     ]).show();

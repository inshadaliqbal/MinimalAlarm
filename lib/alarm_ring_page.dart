import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';
import 'provider_engine.dart';

class AlarmRingPage extends StatelessWidget {



  static const String ringPage = 'alarm_ring_page';
  String title;
  Function functionForSnooze;
  Function functionForClose;

  AlarmRingPage({required this.title, required this.functionForSnooze, required this.functionForClose, super.key});

  @override
  Widget build(BuildContext context) {
    var _value;
    return ChangeNotifierProvider(
      create: (context) => MainEngine(),
      child: Container(
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
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          '${DateTime.timestamp().hour}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: SwipeActionCell(
                            /// this key is necessary
                            key: ObjectKey('list[index]'),
                            trailingActions: <SwipeAction>[
                              SwipeAction(
                                performsFirstActionWithFullSwipe: true,
                                onTap: (CompletionHandler handler) async {
                                  functionForSnooze;
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Swipe Left",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(20)),
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
                    ],
                  )
                ],
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


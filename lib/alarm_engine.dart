import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_engine.dart';

class AlarmEngine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
       return MainEngine();

      },
      child: Container(),
    );
  }
}

import 'package:malarm/alarmsetpage.dart';
import 'package:malarm/provider_engine.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

Future storagePermission(context) async {
  PermissionStatus? status = await Permission.storage.request();
  if (status.isGranted) {
    print('Storage permission is granted.');
    Provider.of<MainEngine>(context).permissionGranted(status);
  } else {
    print('Storage permission is denied.');
  }
}

Future<dynamic> filePicker(context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
  );
  return result;
}

Future alarmSetFilePicker(context) async {
  String? filePath;
  await storagePermission(context);
  FilePickerResult result = await filePicker(context);
  filePath = result.files.first.path;
  // setState(() {
  return filePath.toString();
  // });
}

void AlarmSetSaveButtonFunction(BuildContext context, AlarmSet widget) async {
  if (Provider.of<MainEngine>(context, listen: false).getListLength() ==
      widget.currentIndex + 1) {
    Provider.of<MainEngine>(context, listen: false)
        .deleteAlarm(widget.currentIndex);
    Provider.of<MainEngine>(context, listen: false).addAlarmCard(
      context,
      widget.currentIndex,
      widget.alarmCardClass.alarmTitle!,
      widget.alarmCardClass.hourSelected!,
      widget.alarmCardClass.minuteSelected!,
      widget.alarmCardClass.daysList!,
      widget.alarmCardClass.zoneSelected,
      true,
      widget.alarmCardClass.vibrateActive,
      widget.alarmCardClass.fileSelectedPath,
    );
  } else {

    print('file send to provider');
    Provider.of<MainEngine>(context, listen: false).addAlarmCard(
      context,
      widget.currentIndex - 1,
      widget.alarmCardClass.alarmTitle!,
      widget.alarmCardClass.hourSelected!,
      widget.alarmCardClass.minuteSelected!,
      widget.alarmCardClass.daysList!,
      widget.alarmCardClass.zoneSelected,
      true,
      widget.alarmCardClass.vibrateActive,
      widget.alarmCardClass.fileSelectedPath,
    );
  }
}

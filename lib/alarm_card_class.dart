class AlarmCardClass {
  String? alarmTitle;
  int hourSelected;
  int minuteSelected;
  List? daysList;
  String zoneSelected;
  bool? isActive = true;
  bool vibrateActive = true;
  String fileSelectedPath;

  AlarmCardClass({
    required this.alarmTitle,
    required this.daysList,
    required this.hourSelected,
    required this.minuteSelected,
    required this.zoneSelected,
    required this.isActive,
    required this.vibrateActive,
    required this.fileSelectedPath
  });

  void isActiveSwitch() {
    isActive = !isActive!;
  }

  void vibrateChange(){
    vibrateActive = vibrateActive;
  }
}

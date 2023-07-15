
String formatTime(int duration) {
  int minutes = (duration / 60000).floor();
  int seconds = ((duration % 60000) / 1000).round();
  
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');
  
  return "$minutesStr:$secondsStr";
}
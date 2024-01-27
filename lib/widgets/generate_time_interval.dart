
List<DateTime> generateTimeIntervals(String date,String startTime, String endTime) {

  DateTime start = DateTime.parse("$date $startTime");
  DateTime end = DateTime.parse("$date $endTime");
  final result = <DateTime>[];
  while (start.isBefore(end)) {
    result.add(start);
    start = start.add(const Duration(minutes: 30));
  }
  return result;
}


// String formatTime(DateTime time) {
//   return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
// }
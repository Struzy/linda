import 'package:linda/classes/daytime.dart';

class DaytimeList {
  List<Daytime> daytimeList = [
    Daytime(now: DateTime.now(),
        morningBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0, 0, 0),
        morningEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0, 0, 0),
        forenoonBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0, 0, 0),
        forenoonEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0, 0, 0),
        noonBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0, 0, 0),
        noonEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0, 0, 0),
        afternoonBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0, 0, 0),
        afternoonEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 0, 0, 0),
        eveningBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 0, 0, 0),
        eveningEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 0, 0, 0),
        nightBegin: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 0, 0, 0),
        nightEnd: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0, 0, 0))
  ];
}

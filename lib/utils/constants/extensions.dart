extension DayOfWeek on DateTime {
  String get dayOfWeek {
    List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return daysOfWeek[weekday - 1];
  }
}

extension UnixTimestampToDateTime on int {
  String toTime() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    int hour = dateTime.hour;

    String amPm = (hour >= 12) ? 'PM' : 'AM';
    int formattedHour = hour % 12;

    if (formattedHour == 0) formattedHour = 12;

    return '$formattedHour $amPm';
  }
}

extension Temperature on dynamic {
  double toTempDouble() {
    if (this is int) {
      return this.toDouble();
    } else if (this is double) {
      return this;
    } else {
      return 0.0;
    }
  }
}
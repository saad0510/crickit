extension DateStrExt on DateTime {
  String get dateFormatedLong => '$day ${_monthName[month]} $year';

  String get dateFormated => '$day ${_monthName[month]}';

  String get timeFormated {
    final local = toLocal();
    final hr = local.hour;
    final min = local.minute;
    final hrStr = hr.toString().padLeft(2, '0');
    final minStr = min.toString().padLeft(2, '0');
    return '$hrStr:$minStr';
  }

  String get ageStr {
    final now = DateTime.now();
    final difference = now.difference(this);
    final days = difference.inDays;
    if (days >= 1) return dateFormated;
    if (now.day != day) return 'Yesterday';
    return 'Today';
  }

  String get ageDetailStr {
    final age = ageStr;
    if (age == 'Today') return timeFormated;
    return age;
  }

  String get weekdayStr => _weekdayName[weekday]!;

  List<String> get allWeekdays => _weekdayName.values.toList();

  List<String> get allMonths => _monthName.values.toList();

  bool isBetween(DateTime past, DateTime future) {
    if (this == past || this == future) return true;
    return isAfter(past) && isBefore(future);
  }

  int get ageInYears => DateTime.now().difference(this).inDays ~/ 365;

  DateTime subtractYears(int years) => copyWith(year: year - years);
}

final _monthName = {
  DateTime.january: 'Jan',
  DateTime.february: 'Feb',
  DateTime.march: 'Mar',
  DateTime.april: 'Apr',
  DateTime.may: 'May',
  DateTime.june: 'Jun',
  DateTime.july: 'Jul',
  DateTime.august: 'Aug',
  DateTime.september: 'Sep',
  DateTime.october: 'Oct',
  DateTime.november: 'Nov',
  DateTime.december: 'Dec',
};

final _weekdayName = {
  DateTime.monday: 'Monday',
  DateTime.tuesday: 'Tuesday',
  DateTime.wednesday: 'Wednesday',
  DateTime.thursday: 'Thursday',
  DateTime.friday: 'Friday',
  DateTime.saturday: 'Saturday',
  DateTime.sunday: 'Sunday',
};

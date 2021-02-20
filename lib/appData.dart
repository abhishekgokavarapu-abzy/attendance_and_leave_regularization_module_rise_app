import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppData extends ChangeNotifier {
  DateTime _currentSelectedTime = DateTime.now();
  var shiftTimingsData;
  var loginTimingsData;
  String _loginTime;
  String _shiftStartTime;
  String _shiftEndTime;
  String notFound = 'Not Found';

  String get loginTime => _loginTime;
  String get shiftStartTime => _shiftStartTime;
  String get shiftEndTime => _shiftEndTime;
  DateTime get currentSelectedTime => _currentSelectedTime;

  void setSelectedLoginAndShiftTimes({DateTime date}) {
    _currentSelectedTime = date;

    String loginTime = getLoginTime();
    String shiftStartTime = getShiftStartTime();
    String shiftEndTime = getShiftEndTime();

    _setNewLoginTime(loginTime);
    _setNewShiftStartTime(shiftStartTime);
    _setNewShiftEndTime(shiftEndTime);
  }

  String getLoginTime() {
    String loginTime;
    DateTime selectedDate = DateTime.parse(currentSelectedTime.toString());
    for (var data in loginTimingsData) {
      DateTime referenceDate = DateTime.parse(data['login_time']);
      if ((selectedDate.year == referenceDate.year) &&
          ((selectedDate.month == referenceDate.month) &&
              (selectedDate.day == referenceDate.day))) {
        loginTime =
            '${referenceDate.hour}:${referenceDate.minute}:${referenceDate.second}';
      }
    }
    if (loginTime == null) {
      loginTime = notFound;
    }
    return loginTime;
  }

  String getShiftStartTime() {
    DateTime selectedDate = DateTime.parse(currentSelectedTime.toString());
    String shiftStartTime;
    for (var data in shiftTimingsData) {
      DateTime referenceDate = DateTime.parse(data['shift_date']);
      if ((selectedDate.year == referenceDate.year) &&
          ((selectedDate.month == referenceDate.month) &&
              (selectedDate.day == referenceDate.day))) {
        if (data['shift_start_time'] != null &&
            data['shift_end_time'] != null) {
          shiftStartTime = data['shift_start_time'];
        }
      }
    }

    if (shiftStartTime == null || shiftEndTime == null) {
      shiftStartTime = notFound;
    }
    print(shiftStartTime);
    return shiftStartTime;
  }

  String getShiftEndTime() {
    DateTime selectedDate = DateTime.parse(currentSelectedTime.toString());
    String shiftEndTime;
    for (var data in shiftTimingsData) {
      DateTime referenceDate = DateTime.parse(data['shift_date']);
      if ((selectedDate.year == referenceDate.year) &&
          ((selectedDate.month == referenceDate.month) &&
              (selectedDate.day == referenceDate.day))) {
        if (data['shift_start_time'] != null &&
            data['shift_end_time'] != null) {
          shiftEndTime = data['shift_end_time'];
        }
      }
    }

    if (shiftStartTime == null || shiftEndTime == null) {
      shiftEndTime = notFound;
    }
    print(shiftEndTime);
    return shiftEndTime;
  }

  void _setNewLoginTime(String date) {
    _loginTime = date;
    notifyListeners();
  }

  void _setNewShiftStartTime(String date) {
    _shiftStartTime = date;
    notifyListeners();
  }

  void _setNewShiftEndTime(String date) {
    _shiftEndTime = date;
    notifyListeners();
  }
}

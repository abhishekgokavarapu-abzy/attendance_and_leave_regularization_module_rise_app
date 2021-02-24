import 'package:attendance_leaves_module/appData.dart';
import 'package:attendance_leaves_module/widgets/calendar-date-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appData, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: TableCalendar(
            builders: CalendarBuilders(dayBuilder: (context, date, _) {
              var shiftData = appData.shiftTimingsData;
              bool isPresent = false;
              bool isWeekOff = false;
              bool isPublicHoliday = false;
              bool isAttendanceRegularized = false;
              for (var data in shiftData) {
                DateTime instanceDate = DateTime.parse(data['shift_date']);
                if ((instanceDate.year == date.year) &&
                    (instanceDate.day == date.day &&
                        instanceDate.month == date.month)) {
                  var attendanceCode = data['is_present'];
                  switch (attendanceCode) {
                    case 1:
                      {
                        isPresent = true;
                      }
                      break;
                    case 2:
                      {
                        isWeekOff = true;
                      }
                      break;
                    case 3:
                      {
                        isPublicHoliday = true;
                      }
                      break;
                    case 5:
                      {
                        isAttendanceRegularized = true;
                      }
                      break;
                  }
                }
              }

              return CalendarDateWidget(
                  date: date,
                  isPresent: isPresent,
                  isWeekOff: isWeekOff,
                  isPublicHoliday: isPublicHoliday,
                  isAttendanceRegularized: isAttendanceRegularized);
            }),
            calendarController: _controller,
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            headerStyle: HeaderStyle(centerHeaderTitle: true),
            calendarStyle:
                CalendarStyle(weekendStyle: TextStyle(color: Colors.blue)),
            onDaySelected: (date, events, holidays) {
              appData.setCurrentSelectedTime(date: date);
              appData.setSelectedLoginAndShiftTimes();
            },
          ),
        ),
      ),
    );
  }
}

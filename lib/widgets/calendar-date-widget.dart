import 'package:flutter/material.dart';

class CalendarDateWidget extends StatelessWidget {
  final DateTime date;
  final bool isPresent;
  final bool isWeekOff;
  final bool isPublicHoliday;
  final bool isLeave;
  final bool isAttendanceRegularized;
  final bool isFullDayAbsent;
  final bool isHalfDayAbsent;
  final bool isHalfDayLeave;
  final bool isLop;

  Color _assignColor() {
    if (isPresent) {
      return Color(0xFF90EE90);
    } else if (isWeekOff) {
      return Color(0xFF007A91);
    } else if (isPublicHoliday) {
      return Color(0xFFDA458F);
    } else
      return Colors.white;
  }

  CalendarDateWidget(
      {this.date,
      this.isPresent = false,
      this.isWeekOff = false,
      this.isPublicHoliday = false,
      this.isLeave = false,
      this.isAttendanceRegularized = false,
      this.isFullDayAbsent = false,
      this.isHalfDayAbsent = false,
      this.isHalfDayLeave = false,
      this.isLop = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Center(
            child: isAttendanceRegularized
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(date.day.toString()),
                        SizedBox(
                          height: 1.5,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 10.0,
                        ),
                      ],
                    ),
                  )
                : Text(
                    date.day.toString(),
                    textAlign: TextAlign.end,
                  )),
        decoration: BoxDecoration(
            color: _assignColor(), borderRadius: BorderRadius.circular(300.0)),
      ),
    );
  }
}

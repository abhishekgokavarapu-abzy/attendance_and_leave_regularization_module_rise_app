import 'package:attendance_leaves_module/appData.dart';
import 'package:attendance_leaves_module/widgets/login-info-widget.dart';
import 'package:attendance_leaves_module/widgets/shift-info-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInAndShiftInfoWidget extends StatefulWidget {
  @override
  _LogInAndShiftInfoWidgetState createState() =>
      _LogInAndShiftInfoWidgetState();
}

class _LogInAndShiftInfoWidgetState extends State<LogInAndShiftInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appData, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          LoginInfoWidget(
              loginTime: appData.loginTime == null
                  ? appData.getLoginTime()
                  : appData.loginTime),
          ShiftInfoWidget(
            shiftStartTime: appData.shiftStartTime == null
                ? appData.getShiftStartTime()
                : appData.shiftStartTime,
            shiftEndTime: appData.shiftEndTime == null
                ? appData.getShiftEndTime()
                : appData.shiftEndTime,
          )
        ],
      );
    });
  }
}

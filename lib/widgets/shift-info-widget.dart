import 'package:attendance_leaves_module/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_leaves_module/appData.dart';

class ShiftInfoWidget extends StatelessWidget {
  final String shiftStartTime;
  final String shiftEndTime;
  ShiftInfoWidget({@required this.shiftStartTime, @required this.shiftEndTime});

  Widget showTimingsWidget() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              shiftStartTime,
              style: kShiftDetailsTimeBodyTextStyle,
            ),
            Text(
              '-',
              style: kShiftDetailsTimeBodyTextStyle,
            ),
            Text(
              shiftEndTime,
              style: kShiftDetailsTimeBodyTextStyle,
            )
          ],
        ),
      );

  Widget showNotFoundWidget() => Text(
        shiftStartTime,
        style: kShiftDetailsTimeBodyTextStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Shift Timings:'.toUpperCase(),
                style: kShiftDetailsHeadingTextStyle,
              ),
              (shiftStartTime == Provider.of<AppData>(context).notFound ||
                      shiftEndTime == Provider.of<AppData>(context).notFound)
                  ? showNotFoundWidget()
                  : showTimingsWidget()
            ],
          ),
        ),
      ),
    );
  }
}

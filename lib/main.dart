import 'package:attendance_leaves_module/appData.dart';
import 'package:attendance_leaves_module/screens/calendar-screen.dart';
import 'package:attendance_leaves_module/screens/initial-loading-screen.dart';
import 'package:attendance_leaves_module/themes/apollo-theme-data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AttendanceLeavesModule());
}

class AttendanceLeavesModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: apolloThemeData,
        initialRoute: InitialLoadingScreen.id,
        routes: {
          InitialLoadingScreen.id: (context) => InitialLoadingScreen(
                username: 'vc0488',
              ),
          CalendarScreen.id: (context) => CalendarScreen(),
        },
      ),
    );
  }
}

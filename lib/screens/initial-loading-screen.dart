import 'package:attendance_leaves_module/appData.dart';
import 'package:attendance_leaves_module/screens/calendar-screen.dart';
import 'package:attendance_leaves_module/services/shift-info-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class InitialLoadingScreen extends StatefulWidget {
  static const String id = 'initial_loading_screen';
  final String username;
  InitialLoadingScreen({@required this.username});
  @override
  _InitialLoadingScreenState createState() => _InitialLoadingScreenState();
}

class _InitialLoadingScreenState extends State<InitialLoadingScreen> {
  void _fetchLoginAndShiftData(String username) async {
    ShiftInfoService shiftInfoService = ShiftInfoService();
    var shiftTimingsData =
        await shiftInfoService.getShiftTimingsDetails(username);
    var loginTimingsData =
        await shiftInfoService.getShiftLoginDetails(username);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      Provider.of<AppData>(context).shiftTimingsData = shiftTimingsData;
      Provider.of<AppData>(context).loginTimingsData = loginTimingsData;
      return CalendarScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    _fetchLoginAndShiftData(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF005C71),
        child: SpinKitWanderingCubes(
          color: Color(0xFFFFB300),
        ),
      ),
    );
  }
}

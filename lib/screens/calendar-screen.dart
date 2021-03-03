import 'package:attendance_leaves_module/constants.dart';
import 'package:attendance_leaves_module/widgets/FAB-speed-dial-widget.dart';
import 'package:attendance_leaves_module/widgets/calendar-widget.dart';
import 'package:attendance_leaves_module/widgets/login-and-shift-info-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalendarScreen extends StatelessWidget {
  static const String id = 'calendar_screen_page';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        child: Stack(children: <Widget>[
          BackgroundDesignShape(size: size),
          Column(
            children: [
              UserProfileDetailsWidget(),
              CalendarWidget(),
              LogInAndShiftInfoWidget()
            ],
          ),
        ]),
      ),
      floatingActionButton: FabSpeedDial(),
    );
  }
}

class UserProfileDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 64,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/blank-profile-picture.png'),
                    radius: 32,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ABHISHEK G'.toUpperCase(),
                        style: kUserNameTextStyle,
                      ),
                      Text(
                        'UPTM0187'.toUpperCase(),
                        style: kEmployeeIDTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundDesignShape extends StatelessWidget {
  BackgroundDesignShape({@required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.9,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(150, 50)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF007F9E), Color(0xFFFFB300)])),
    );
  }
}

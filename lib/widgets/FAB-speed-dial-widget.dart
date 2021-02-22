import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FabSpeedDial extends StatefulWidget {
  @override
  _FabSpeedDialState createState() => _FabSpeedDialState();
}

class _FabSpeedDialState extends State<FabSpeedDial> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.remove,
      buttonSize: 56.0,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Color(0xFFFFA000),
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.calendar_view_day_rounded),
          backgroundColor: Color(0xFF1292B7),
          label: 'Attendance Regularization',
          labelStyle: GoogleFonts.montserrat(
              fontSize: 18.0, fontWeight: FontWeight.bold),
          labelBackgroundColor: Color(0xFFFFB300),
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.card_travel),
          backgroundColor: Color(0xFF1292B7),
          label: 'Leave Regularization',
          labelStyle: GoogleFonts.montserrat(
              fontSize: 18.0, fontWeight: FontWeight.bold),
          labelBackgroundColor: Color(0xFFFFB300),
          onTap: () => print('SECOND CHILD'),
        ),
      ],
    );
  }
}

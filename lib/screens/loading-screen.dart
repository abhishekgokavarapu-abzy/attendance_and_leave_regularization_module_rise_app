import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF005C71),
        child: SpinKitDoubleBounce(
          color: Color(0xFFFFB300),
        ),
      ),
    );
  }
}

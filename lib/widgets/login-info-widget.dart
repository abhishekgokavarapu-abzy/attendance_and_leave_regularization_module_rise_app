import 'package:attendance_leaves_module/constants.dart';
import 'package:flutter/material.dart';

class LoginInfoWidget extends StatelessWidget {
  final String loginTime;
  LoginInfoWidget({@required this.loginTime});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Log-In Time:'.toUpperCase(),
                style: kLoginDetailsHeadingTextStyle,
              ),
              Text(
                loginTime,
                style: kLoginDetailsTimeBodyTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}

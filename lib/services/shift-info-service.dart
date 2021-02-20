import 'package:attendance_leaves_module/services/network-helper.dart';

const String shiftInfoURL =
    'http://172.28.7.58:8000/emp_management/emp_login_shift';
const String loginInfoUrl =
    'http://172.28.7.58:8000/emp_management/emp_login_tracker';

class ShiftInfoService {
  Future<dynamic> getShiftTimingsDetails(String username) async {
    NetworkHelper networkHelper = NetworkHelper('$shiftInfoURL/$username');
    var shiftData = await networkHelper.getData();
    return shiftData;
  }

  Future<dynamic> getShiftLoginDetails(String username) async {
    NetworkHelper networkHelper = NetworkHelper('$loginInfoUrl/$username');
    var loginData = await networkHelper.getData();
    return loginData;
  }
}

//ga2175

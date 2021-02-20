import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  http.Response response = await http
      .get('http://172.28.7.58:8000/emp_management/emp_login_shift/ga2175/');

  DateTime testDate = DateTime.parse('2021-12-18');
  if (response.statusCode == 200) {
    String data = response.body;
    List jsonDecodedData = jsonDecode(data);
    print(jsonDecodedData.length);
    for (var currentObject in jsonDecodedData) {
      DateTime referWith = DateTime.parse(currentObject['shift_date']);
      if ((testDate.day == referWith.day) &&
          (testDate.month == referWith.month &&
              testDate.year == referWith.year)) {
        if (currentObject['shift_start_time'] == null) {
          print('it is null');
        }
        if (currentObject['shift_end_time'] == null) {
          print('it is null');
        }
      }
    }
  } else {
    print(response.statusCode);
  }
}

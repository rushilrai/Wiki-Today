import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

bool dataReceived = false;

void post() async {
  var now = DateTime.now();
  var date = DateFormat("LLLL_d").format(now);
  print(date);
  var responsePost =
      await http.post('https://wiki-todayv1.herokuapp.com/wiki/$date');
  print(responsePost.statusCode);
}

void get() async {
  http.Response responseGet =
      await http.get('https://wiki-todayv1.herokuapp.com/wiki');
  if (responseGet.statusCode == 200) {
    String data = responseGet.body;
    birthsList = jsonDecode(data)['Births'];
    deathsList = jsonDecode(data)['Deaths'];
    eventsList = jsonDecode(data)['Events'];
    holidaysList = jsonDecode(data)['Holidays_and_observances'];
  }
}

void dataReceive() async {
  await post();
  await get();
  dataReceived = true;
}

List<dynamic> birthsList = [];
List<dynamic> deathsList = [];
List<dynamic> eventsList = [];
List<dynamic> holidaysList = [];

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TimerData extends StatefulWidget {
  const TimerData({Key? key}) : super(key: key);

  @override
  State<TimerData> createState() => _TimerDataState();
}

class _TimerDataState extends State<TimerData> {
  static const maxSecond = 60;
  int seconds = maxSecond;
  Timer? timer;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      startTimer();
    });
  }


  void startTimer() async {
    final url = Uri.https(
        'sim800data-default-rtdb.asia-southeast1.firebasedatabase.app',
        'locationData.json');

    final response = await http.get(url);
    print('get data response:');
    print(response.statusCode);

    // setState(() async {
    //   seconds++;
    // });
  }
      

    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$seconds'),
      ),
    );
  }
}

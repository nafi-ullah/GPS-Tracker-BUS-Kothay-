import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _FetchingData();
  }
  void _FetchingData() async {
    final url = Uri.https(
        'sim800data-default-rtdb.asia-southeast1.firebasedatabase.app',
        'locationData.json');

    final response = await http.get(url);
    print('get data response:');
    //print(response.body);
    final Map<String, dynamic > listData = json.decode(response.body);

    for (var entry in listData.entries) {
      var key = entry.key;
      var value = entry.value['latitude'];
      print('MyKey: $key, MyValue: $value');
    }
    final jsonData = json.decode(response.body);
    final keys = jsonData.keys.toList();

    final lastKey = keys.last;
    final lastData = jsonData[lastKey]; // Access the last data object

    final longitude = lastData['longitude'];
    final latitude = lastData['latitude'];

    print('My Last Longitude: $longitude');
    print('My Last Latitude: $latitude');

    // for (final item in listData.entries) {
    //   print(item.value['longitude']);
    //
    // };
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is running well'),
      )
    );
  }
}

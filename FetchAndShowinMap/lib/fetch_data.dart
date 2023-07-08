import 'package:fetch_firebase/another_mapScreen.dart';
import 'package:fetch_firebase/map_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  String _latituku='23.555555';
  String _longituku='90.555555';
  //List<String> location= [];
 // LatLng pointu = LatLng(23.555555 90.555555);
  bool isLoaded = false;
  Widget content = Center(
    child: CircularProgressIndicator(),
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _FetchingData() ;
  }
  void _FetchingData() async {
    final url = Uri.https(
        'sim800data-default-rtdb.asia-southeast1.firebasedatabase.app',
        'locationData.json');

    final response = await http.get(url);
    print('get data response:');
    //print(response.body);

    //-----------------reading all data-----------------------
    // final Map<String, dynamic > listData = json.decode(response.body);
    // for (var entry in listData.entries) {
    //   var key = entry.key;
    //   var value = entry.value['latitude'];
    //   print('MyKey: $key, MyValue: $value');
    // }
    //------------------------------------------------------
    final jsonData = json.decode(response.body);
    final keys = jsonData.keys.toList();

    final lastKey = keys.last;
    final lastData = jsonData[lastKey]; // Access the last data object

    final longitude = lastData['longitude'];
    final latitude = lastData['latitude'];

    //---------------LatLongPoint----------------------
    final lati = longitude;
    final longi =  latitude;

    double latit = double.parse(lati);
    double longit = double.parse(longi);

    //LatLng pointuk =  LatLng(latit,longit);
    //----------------------------------------

  setState(() {
    _latituku = latitude.toString();
    _longituku = longitude.toString();
    isLoaded = true;
   // pointu = pointuk;
   // print('_lati is updated $_lati');
  });


    print('Last Longitude from fetch screen: $longitude');
    print('Last Latitude: $latitude');


    // for (final item in listData.entries) {
    //   print(item.value['longitude']);
    //
    // };
    //print(response.body);
  }




  @override
  Widget build(BuildContext context) {
    if(isLoaded){
      content = MapScreen(Latitude: _latituku, Longitude: _longituku);
    }


    return Scaffold(
      body: content,
    );
  }
}

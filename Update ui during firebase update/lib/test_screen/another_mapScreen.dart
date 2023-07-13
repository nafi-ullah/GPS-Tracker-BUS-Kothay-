import 'package:fetch_firebase/map_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MapScreenUltra extends StatefulWidget {
  const MapScreenUltra({
    super.key,
     required this.latitutu,
     required this.longitutu
  });

  final String latitutu;
  final String longitutu;

  @override
  State<MapScreenUltra> createState() => _MapScreenUltraState();
}

class _MapScreenUltraState extends State<MapScreenUltra> {
  // var latitu ;
  // var longitu ;
  // var point;
  // @override
  // void initState() async{
  //   super.initState();
  //
  //   // Accessing the lati and longi values
  //   final url = Uri.https(
  //       'sim800data-default-rtdb.asia-southeast1.firebasedatabase.app',
  //       'locationData.json');
  //
  //   final response = await http.get(url);
  //   print('get data response:');
  //
  //   final jsonData = json.decode(response.body);
  //   final keys = jsonData.keys.toList();
  //
  //   final lastKey = keys.last;
  //   final lastData = jsonData[lastKey]; // Access the last data object
  //
  //   final longitude = lastData['longitude'];
  //   final latitude = lastData['latitude'];
  //
  //   double latit = double.parse(latitude);
  //   double longit = double.parse(longitude);
  //   latitu = latit;
  //   longitu = longit;
  //   LatLng pointu = LatLng(latit,longit);
  //   point = pointu;
  //   // Do something with lati and longi
  //   print('Latitude from map_screen: $latit');
  //   print('Longitude: $longit');
  // }
  //
  //
  String latitude='';
  String longitude='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latitude = widget.latitutu;
    longitude = widget.longitutu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OpenStreetMap'),
        ),

    );
  }
}
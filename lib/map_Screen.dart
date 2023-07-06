import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng point = LatLng(23.765027, 90.430152);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMap'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: point,
          zoom: 17.0,
        ),

        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 50.0,
                height: 50.0,
                point: point,
                builder: (ctx) => Container(
                  child:  Image.asset('assets/images/bus_point.png')
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

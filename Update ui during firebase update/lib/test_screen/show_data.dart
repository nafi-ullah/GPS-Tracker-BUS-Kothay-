import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sendData();
  }


  void _sendData() async{
    //final url = Uri.https('shopping-app-e0df5-default-rtdb.asia-southeast1.firebasedatabase.app','shopping-list.json');
      final url = Uri.https('sim800data-default-rtdb.asia-southeast1.firebasedatabase.app','shopping-list.json');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
            {
              'name': 'DaalVaja23',
              'quantity': '5',
              'category': 'Vegetables',
            }
        )
    );
    print(response.statusCode);

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is show data"),
      )
    );
  }
}

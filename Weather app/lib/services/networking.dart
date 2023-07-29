import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';


class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  
  BuildContext? get context => null;

  Future getData() async {
    var finalurl = Uri.parse(url);

    http.Response response = await http.get(finalurl);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
    
  }
}

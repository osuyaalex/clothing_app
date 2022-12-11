import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import 'package:clothing_app/network/category%20network/model.dart';

class Newnet{
  Future<List<Children>> fetchPhotos(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://asos2.p.rapidapi.com/categories/list'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parseChildren, response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<Children> parseChildren(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Children>((json) => Children.fromJson(json)).toList();
  }

}

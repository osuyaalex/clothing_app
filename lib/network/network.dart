import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'model.dart';

class Network {
  Future<Product> fetchProduct() async {
    final response = await http.get(
      Uri.parse('https://asos2.p.rapidapi.com/categories/list'),
      // Send authorization headers to the backend.
      headers: {
        'X-RapidAPI-Key': '91141ed83bmsh82536b1b424fd15p190436jsnb45b70005b13',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200){
      final responseJson = json.decode(response.body);
      print('The Url is:${response.body}');

      return Product.fromJson(responseJson);
    }else{
      throw Exception('Error getting products');
    }

  }
}

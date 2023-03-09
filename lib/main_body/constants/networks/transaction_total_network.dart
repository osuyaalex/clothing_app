import 'dart:convert';

import 'package:clothing_app/main_body/constants/models/transaction_total_model.dart';
import 'package:http/http.dart' as http;

class Networks{
  Future<TransactionTotal> getTransactionTotal() async {
    var jsonResponse;
    try {
      final String apiKey = 'sk_test_d0d545083aa89e098b27f1a9cd113cef01e08969';
      final String url = 'https://api.paystack.co/transaction/totals';
      final response = await http.get(Uri.parse('$url'), headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      });
      print('hhhhhhhhhhhh');
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        jsonResponse  = jsonDecode(response.body);

      } else {
        throw Exception('Failed to load transactions');
      }
    } catch(error){
      print(error.toString());
    }

    return TransactionTotal.fromJson(jsonResponse);


  }
}
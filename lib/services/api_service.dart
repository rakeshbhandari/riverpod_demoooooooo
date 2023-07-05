import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo001/model/api_model.dart';

final apiserviceProvider = Provider((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    print("hgf");
    try {
      final res = await Dio().get('https://jsonplaceholder.typicode.com/users');
      print(res.statusCode);
      final data = jsonDecode(res.data);
      final List<dynamic> items = data;
      return Suggestion.fromJson(items[0]);
    } catch (e) {
      throw Exception("Error in getting suggestion");
    }
  }
}

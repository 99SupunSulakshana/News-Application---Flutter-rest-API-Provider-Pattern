// ignore_for_file: unused_field, prefer_final_fields

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
  String _apiKey = '6abc63e43e404ff791d0bc2cc219411c';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2022-03-17&sortBy=publishedAt&apiKey=$_apiKey'),
          //'http://dev.gurulugomi.lk/api/v1.0/home'),
    );

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error: It could be your internet connection!';
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}

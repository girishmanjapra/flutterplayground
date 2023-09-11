import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';
import '../models/name.dart';

class UserViewModel extends ChangeNotifier {
  String apiUrl = ApiUrls.mobileVerification;

  Future<int> loginUser(Username name) async {
    try {
      print(apiUrl);
      print(name.username);
      final response = await http.post(Uri.parse(apiUrl), body: {
        'phone': name.username,
      });

      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('Status')) {
        int statusCode = jsonResponse['Status'];
        if (statusCode == 200) {
          return 200;
        }
        if (statusCode == 400) {
          return 400;
        } else {
          return 500;
        }
      } else {
        return 600;
      }
    } catch (e) {
      return 601;
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './../models/user.dart';
import '../api/api.dart';

class LoginViewModel extends ChangeNotifier {
  String apiUrl = ApiUrls.mobileVerification;

  Future<int> loginUser(User user) async {
    try {
      print(apiUrl);
      print(user.phone);
      final response = await http.post(Uri.parse(apiUrl), body: {
        'phone': user.phone,
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

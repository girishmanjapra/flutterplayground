// viewmodels/otp_view_model.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/model_otp.dart';

class OtpModel extends ChangeNotifier {
  final TextEditingController otpController = TextEditingController();

  bool _shouldShowButton = false;
  bool get shouldShowButton => _shouldShowButton;

  Future<bool> submitOtp(OtpClass otpnumber) async {
    try {
      print("pppppppp");
      print("*****" + otpnumber.otp);

      final url = 'YOUR_API_ENDPOINT'; // Replace with your API endpoint
      final response = await http.post(
        Uri.parse(url),
        body: {'otp': otpnumber.otp},
      );

      // PurposeScreen

      if (response.statusCode == 200) {
        // Handle successful response from the server
        print("OTP verification successful!");
        return true;
        // You can navigate to the next screen or perform any other action here
      } else {
        // Handle unsuccessful response from the server
        print("OTP verification failed. Please try again.");
        return false;
        // You can display an error message to the user or handle the error as needed
      }
    } catch (error) {
      // Handle any exceptions that occurred during the HTTP request
      print("Error occurred: $error");
      return true;
      // You can display an error message to the user or handle the error as needed
    }
  }
}

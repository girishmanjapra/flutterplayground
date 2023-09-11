import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class PostViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> posts = [];

  Future<void> fetchData() async {
    if (posts.isEmpty) {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        posts = List<Map<String, dynamic>>.from(json.decode(response.body));
        notifyListeners(); // Ensure that you are calling this to notify listeners of data changes.
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  void toggleCheckbox(int index, bool? newValue) {
    posts[index]['checked'] = newValue;
    notifyListeners();
  }

  List<Map<String, dynamic>> getCheckedPosts() {
    return posts.where((post) => post['checked'] == true).toList();
  }
}
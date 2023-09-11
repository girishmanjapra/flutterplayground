
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class FileUploadViewModel with ChangeNotifier {
  double _progress = 0;
  double get progress => _progress;

  Future<void> pickFileAndUpload() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final Uint8List fileBytes = result.files.single.bytes!;
      final base64String = base64Encode(fileBytes);
      print(base64String);
      await uploadBase64String(base64String);
    }
  }

  Future<void> uploadBase64String(String base64String) async {
    final url = Uri.parse('YOUR_UPLOAD_API_ENDPOINT');
    final response = await http.post(
      url,
      body: jsonEncode({'fileData': base64String}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }
}

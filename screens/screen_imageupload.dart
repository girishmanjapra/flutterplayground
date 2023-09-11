import 'dart:convert'; // Add this import for Base64 encoding
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/imageupload_viewmodel.dart';

class FileUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('File Upload Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  final viewModel =
                      Provider.of<FileUploadViewModel>(context, listen: false);
                  await viewModel.pickFileAndUpload();
                },
                child: Text('Select File and Upload'),
              ),
              Consumer<FileUploadViewModel>(
                builder: (context, viewModel, child) {
                  return LinearProgressIndicator(value: viewModel.progress);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

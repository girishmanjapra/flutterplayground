import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class IndexFormScreen extends StatelessWidget {
  final TextEditingController _inputusername = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  IndexFormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Row(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Center(
                  child: Image.asset("Assets/Images/indeximage_1.png"),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "User Name", controller: _inputusername),
                    CustomTextField(
                        labelText: "Password", controller: _inputPassword)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

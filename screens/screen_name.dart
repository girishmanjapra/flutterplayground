// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/screen_course_selection.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import './../viewmodels/username_viewmodel.dart';
import '../models/name.dart';
import '../widgets/common_style.dart';
import '../widgets/common_widgets.dart';

class NameFormScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  // GlobalKey to identify the form
  final _formKey = GlobalKey<FormState>();

  NameFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userViewModel = Provider.of<UserViewModel>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    void submitname() async {
      // Check if the form is valid before proceeding
      if (_formKey.currentState?.validate() ?? false) {
        String name = _nameController.text.trim();
        Username username = Username(username: name);
        int loginSuccessful = await userViewModel.loginUser(username);

        if (loginSuccessful == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseSelectionScreen(),
            ),
          );
        } else {
          // Show the SnackBar using ScaffoldMessenger within the else part.
          Fluttertoast.showToast(
            msg: 'Login Failed',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            textColor: const Color.fromARGB(255, 0, 0, 0),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseSelectionScreen(),
            ),
          );
        }
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onClickableTextTap() {
      // ignore: avoid_print
      print("Clickable text tapped!"); // You can perform your action here.
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppTheme.mainBlackCo,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.mainBlackCo,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Use Navigator.pop() here
            },
          ),
          title: Text(
            "Your Name",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg.png'),
                          fit: BoxFit
                              .cover, // You can adjust this property as per your requirement
                        ),
                      ),
                      // color: Color.fromARGB(99, 0, 0, 0),
                      height: 340,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 50, bottom: 20),
                                  child: Image.asset(
                                    'assets/images/tacle-pencil.png',
                                  ),
                                ),

                                // Image.asset(
                                //   'assets/images/img-login.png',
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 25, 25, 25),
                      height: 410,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 60),
                                  child: SvgPicture.asset(
                                    'assets/images/frame.svg', // Replace this with the path to your SVG file
                                    width: 50, // Set the width of the SVG image
                                    height: 90,
                                    // Set the height of the SVG image
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: CustomTextFormField(
                                    controller: _nameController,
                                    keyboardType: TextInputType.name,
                                    hintText: 'Full name',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name to proceed';
                                      }
                                      // Add more complex email/phone number validation if needed.
                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                        text: 'Proceed',
                                        onPressed: submitname,
                                      ),
                                    )
                                  ],
                                ),
                                // ignore: avoid_unnecessary_containers
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

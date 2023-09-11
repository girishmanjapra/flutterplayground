// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/common_style.dart';
import 'package:flutter_svg/svg.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/model_otp.dart';
import '../viewmodels/otp_viewmodel.dart';
import '../widgets/common_widgets.dart';
import 'screen_name.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  // GlobalKey to identify the form
  bool shouldShowButton = false;

  void onTimerEnd() {
    shouldShowButton = true;
  }

  @override
  Widget build(BuildContext context) {
    var otpviewModel = Provider.of<OtpModel>(context);

    void submitOtp() async {
      String otp = otpController.text.trim();
      print(otp);
      OtpClass otpnumber = OtpClass(otp: otp);
      bool otpSuccessful = await otpviewModel.submitOtp(otpnumber);
      print(otpSuccessful);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NameFormScreen(), // Replace NextPage with the widget of the next page
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppTheme.mainBlackCo,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Use Navigator.pop() here
            },
          ),
          title: Text(
            "OTP Verification",
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
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg.png'),
                              fit: BoxFit.fill,
                              // You can adjust this property as per your requirement
                            ),
                          ),
                          height: 350,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 60),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/enterotp.svg', // Replace this with the path to your SVG file
                                          width:
                                              50, // Set the width of the SVG image
                                          height: 70,
                                          // Set the height of the SVG image
                                        ),
                                        Image.asset(
                                          'assets/images/msg.png',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      color: AppTheme.mainBlackCo,
                      height: 450,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: PinCodeTextFieldWidget(
                                    otpController: otpController,
                                    onChanged: (value) {
                                      // Called when the user enters any value in the OTP field
                                      print(value);
                                    },
                                  ),
                                ),

                                const SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    if (!shouldShowButton)
                                      Expanded(
                                        child: CustomElevatedButton(
                                            text: 'Proceed',
                                            onPressed: submitOtp),
                                      ),
                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: '',
                                          style: const TextStyle(
                                            color: Color(0xFF6E7191),
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                          ),
                                          children: const [
                                            TextSpan(
                                              text: ' Change Number',
                                              style: TextStyle(
                                                  color: Color(0xFF777BD1),
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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

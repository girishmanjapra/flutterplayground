import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/common_style.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PurposeScreen extends StatelessWidget {
  PurposeScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  // GlobalKey to identify the form
  bool shouldShowButton = false;

  void onTimerEnd() {
    shouldShowButton = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.mainBlackCo,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Use Navigator.pop() here
            },
          ),
          title: const Text("Purpose",
              textAlign: TextAlign.center, style: AppTheme.appBarTextStyle),
        ),
        backgroundColor: AppTheme.appBgColor,
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
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg.png'),
                              fit: BoxFit.fill,
                              // You can adjust this property as per your requirement
                            ),
                          ),

                          // color: Color.fromARGB(99, 0, 0, 0),
                          height: 250,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 60),
                                    // child: Image.asset(
                                    //   'assets/images/otp.png',
                                    // ),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/ihere.svg', // Replace this with the path to your SVG file
                                          width:
                                              80, // Set the width of the SVG image
                                          height: 70,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: AppTheme.mainBlackCo,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              bottom: 20,
                                              top: 70),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/book.png',
                                                width: 140,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, bottom: 15),
                                                child: SvgPicture.asset(
                                                  'assets/images/Exam-prep.svg', // Replace this with the path to your SVG file
                                                  width:
                                                      20, // Set the width of the SVG image
                                                  height: 25,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/sel-text1.svg', // Replace this with the path to your SVG file
                                                width:
                                                    20, // Set the width of the SVG image
                                                height: 32,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: AppTheme.mainBlackCo,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.only(
                                              left: 30, right: 30, bottom: 20),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/pencil.png',
                                                width: 100,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, bottom: 15),
                                                child: SvgPicture.asset(
                                                  'assets/images/text2.svg', // Replace this with the path to your SVG file
                                                  width:
                                                      20, // Set the width of the SVG image
                                                  height: 80,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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

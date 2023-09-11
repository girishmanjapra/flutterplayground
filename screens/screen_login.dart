// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/common_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './../models/user.dart';
import './../viewmodels/login_viewmodel.dart';
import '../widgets/common_widgets.dart';
import 'screen_otp.dart';

class LoginFormScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginFormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var loginViewModel = Provider.of<LoginViewModel>(context);
    void login() async {
      if (_formKey.currentState?.validate() ?? false) {
        String phone = _emailController.text.trim();
        User user = User(phone: phone);
        int apiStatus = await loginViewModel.loginUser(user);
        if (apiStatus == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(),
            ),
          );
        } else if (apiStatus == 400) {
          CustomToast.show('Bad Request');
        } else if (apiStatus == 500) {
          CustomToast.show('Internal Server Error');
        } else {
          CustomToast.show('Login Failed');
        }
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> onClickableTextTap() async {
      // ignore: avoid_print
      print("Clickable text tapped!"); // You can perform your action here.
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: SingleChildScrollView(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      color: AppTheme.tacklBlack,
                      height: 440,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/bg.png'),
                              fit: BoxFit.cover
                              // You can adjust this property as per your requirement
                              ),
                        ),
                        // color: Color.fromARGB(99, 0, 0, 0),
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 40, bottom: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Hey  👋",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600,
                                              color: AppTheme.normalWhite,
                                              fontFamily: 'Recoleta'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 10),
                                          child: Text(
                                            "Wanna learn smart?",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w300,
                                                color: AppTheme.normalWhite),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/tacle.svg",
                                              height: 23,
                                            ),
                                            Text(
                                              "is for you!",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.normalWhite),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    // child: Image.asset(
                                    //   'assets/images/tagline.png',
                                    // ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Image.asset(
                                      'assets/images/img-login.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 25, 25, 25),
                      height: 410,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: CustomTextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.number,
                                    hintText: 'Phone Number or email',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email or phone number';
                                      } else if (value.length < 10) {
                                        return 'Enter a valid mobile number';
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
                                        text: 'Send OTP',
                                        onPressed: login,
                                      ),
                                    )
                                  ],
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 40, bottom: 20),
                                  child: const Text("or sign in with",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 165, 165, 165),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Image.asset(
                                  'assets/images/google.png',
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'By signing up, you agree to our',
                                        style: const TextStyle(
                                          color: Color(0xFF6E7191),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' Terms of Service',
                                            style: const TextStyle(
                                              color: Color(0xFF777BD1),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = onClickableTextTap,
                                          ),
                                          const TextSpan(
                                              text:
                                                  ' and acknowledge that our'),
                                          TextSpan(
                                            text: ' Privacy Policy',
                                            style: const TextStyle(
                                              color: Color(0xFF777BD1),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = onClickableTextTap,
                                          ),
                                          const TextSpan(
                                              text: ' applies to you.'),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
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

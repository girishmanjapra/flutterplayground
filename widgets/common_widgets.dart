import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'common_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboardType;
  final FormFieldValidator<String>? validator; // Add the validator property.

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.validator, // Add the validator to the constructor.
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: const TextStyle(
        color: AppTheme.secondaryColor,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.secondaryColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.secondaryColor,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppTheme.secondaryColor,
        ),
      ),
      validator: validator, // Pass the validator to the TextFormField.
      controller: controller,
    );
  }
}

class PinCodeTextFieldWidget extends StatelessWidget {
  final TextEditingController otpController;
  final void Function(String)? onChanged;

  const PinCodeTextFieldWidget(
      {super.key, required this.otpController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: otpController,
      keyboardType: TextInputType.number,
      obscureText: true,
      animationType: AnimationType.slide,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 70,
        activeFillColor: Colors.white,
        activeColor: AppTheme.secondaryColor,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.grey,
        selectedColor: AppTheme.secondaryColor,
        selectedFillColor: Colors.white,
      ),
      textStyle: const TextStyle(color: Colors.white),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }
}

class CustomBlackCard extends StatelessWidget {
  const CustomBlackCard({super.key, required child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.mainBlackCo,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }
}

class MainHeadding extends StatelessWidget {
  final String mainHead;
  final String subHead;
  const MainHeadding(
      {super.key, required this.mainHead, required this.subHead});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        children: [
          Text(
            mainHead,
            style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Recoleta',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          ),
          Text(
            subHead,
            style: const TextStyle(color: Color(0xFFA0A3BD), fontSize: 18),
          ),
          SvgPicture.asset("assets/images/underline-yellow.svg")
        ],
      ),
    );
  }
}

class CardLeft extends StatelessWidget {
  final String mainHead;
  final String subHead;
  final VoidCallback onPressed;
  const CardLeft(
      {super.key,
      required this.mainHead,
      required this.subHead,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              subHead,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 13),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              mainHead,
              style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Recoleta'),
              textAlign: TextAlign.left,
            ),
          ),
          IconButton(
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
              onPressed: onPressed),
        ],
      ),
    );
  }
}

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  // ignore: prefer_typing_uninitialized_variables
  final fontSize;

  // ignore: prefer_const_constructors_in_immutables
  CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.padding = const EdgeInsets.only(
          left: 30.0, right: 30.0, bottom: 20.0, top: 20.0),
      this.fontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(fontSize: fontSize),
        backgroundColor: const Color(0xFF777BD1),
      ),
      child: Text(text),
    );
  }
}

class CustomToast {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      textColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }
}

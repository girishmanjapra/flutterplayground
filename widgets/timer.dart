import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CountdownTimerWidget extends StatefulWidget {
  final int duration;
  final VoidCallback onTimerEnd;

  CountdownTimerWidget({required this.duration, required this.onTimerEnd});

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
  }

  void startTimer() {
    setState(() {
      _remainingTime = widget.duration;
    });

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        widget
            .onTimerEnd(); // Call the onTimerEnd callback when the timer finishes
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          child: const Text("Resend in",
              style: TextStyle(
                  color: Color.fromARGB(255, 165, 165, 165),
                  fontSize: 20,
                  fontWeight: FontWeight.w400)),
        ),

        CountdownTimer(
          endTime:
              DateTime.now().millisecondsSinceEpoch + _remainingTime * 1000,
          onEnd: () {
            // Timer finished, do something here (e.g., show an alert)
            widget
                .onTimerEnd(); // Call the onTimerEnd callback when the timer finishes
          },
          textStyle: const TextStyle(
              color: Color.fromARGB(255, 165, 165, 165),
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 16),
        // ElevatedButton(
        //   onPressed: _startTimer,
        //   child: const Text('Start Timer'),
        // ),
      ],
    );
  }
}

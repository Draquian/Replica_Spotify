// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

class CurrentT extends StatefulWidget {
  final double maxTime;
  const CurrentT({
    super.key,
    required this.maxTime,
  });

  @override
  State<CurrentT> createState() => _CurrentTState();
}

class _CurrentTState extends State<CurrentT> {
  Timer? timer;
  Timer? timer2;
  double currentTimer = 0;

  void startTimer() {
    if (currentTimer == 0) {
      {
        timer2 = Timer.periodic(const Duration(seconds: 60), (_) {
          setState(() => currentTimer += 0.4);
        });
      }
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (currentTimer <= widget.maxTime) {
          setState(() => currentTimer += 0.01);
        } else {
          timer?.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    if (currentTimer >= widget.maxTime - 0.01) {
      timer?.cancel();
      timer2?.cancel();
    }
    return Text(
      currentTimer.toStringAsPrecision(3),
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 12,
      ),
    );
  }
}

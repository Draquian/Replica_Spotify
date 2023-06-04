// ignore_for_file: file_names, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

class SliderSong extends StatefulWidget {
  double maxTimer;
  bool isLooping;
  SliderSong({
    super.key,
    required this.isLooping,
    required this.maxTimer,
  });

  @override
  State<SliderSong> createState() => _SliderSongState();
}

class _SliderSongState extends State<SliderSong> {
  Timer? timer;
  double currentTimer = 0;
  double maxTimerInSeconds = 0;
  double text112 = 0;

  void startTimer() {
    if (currentTimer == 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (currentTimer <= maxTimerInSeconds) {
          setState(() => currentTimer += 1);
        } else {
          timer?.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    maxTimerInSeconds = (widget.maxTimer.round() * 60) +
        ((widget.maxTimer - widget.maxTimer.round()) * 100);
    startTimer();
    if (currentTimer >= maxTimerInSeconds - 1) {
      if (widget.isLooping) {
        currentTimer = 0;
      } else {
        timer?.cancel();
      }
    }

    return Slider(
      mouseCursor: MouseCursor.defer,
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
      value: currentTimer,
      max: maxTimerInSeconds,
      divisions: maxTimerInSeconds.round(),
      label: currentTimer.toStringAsPrecision(3),
      onChanged: (double value) {
        setState(() {
          currentTimer = value;
        });
      },
    );
  }
}

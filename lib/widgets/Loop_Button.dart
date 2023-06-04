// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class LoopButton extends StatefulWidget {
  final Color color;
  final bool isLooping;
  const LoopButton({
    super.key,
    required this.color,
    required this.isLooping,
  });

  @override
  State<LoopButton> createState() => _LoopButtonState();
}

class _LoopButtonState extends State<LoopButton> {
  bool loop = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isLooping != widget.isLooping;
          loop = !loop;
        });
      },
      //backgroundColor: widget.color,
      icon: Icon(
        loop ? Typicons.arrow_loop : Typicons.arrow_loop,
        color: loop ? widget.color : Colors.white,
        size: 30, //favorite ?
      ),
    );
  }
}

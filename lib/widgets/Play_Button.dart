// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class PlayButton extends StatefulWidget {
  final Color color;
  const PlayButton({
    super.key,
    required this.color,
  });

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool loop = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          loop = !loop;
        });
      },
      iconSize: 75,
      icon: Icon(
        loop ? Icons.play_circle_fill : Icons.pause_circle_filled,
        color: loop ? widget.color : Colors.white,
        size: 75, //favorite ?
      ),
    );
  }
}

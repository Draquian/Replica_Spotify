// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShuffleButton extends StatefulWidget {
  final Color color;
  const ShuffleButton({
    super.key,
    required this.color,
  });

  @override
  State<ShuffleButton> createState() => _ShuffleButtonState();
}

class _ShuffleButtonState extends State<ShuffleButton> {
  bool shuffle = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          shuffle = !shuffle;
        });
      },
      //backgroundColor: widget.color,
      icon: FaIcon(
        shuffle ? FontAwesomeIcons.shuffle : FontAwesomeIcons.shuffle,
        color: shuffle ? widget.color : Colors.white, //favorite ?
      ),
    );
  }
}

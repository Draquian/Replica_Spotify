// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final Color color;
  const FavoriteButton({
    super.key,
    required this.color,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          favorite = !favorite;
        });
      },
      //backgroundColor: widget.color,
      icon: Icon(
        favorite ? Icons.favorite : Icons.favorite_outline, size: 37,
        color: favorite ? widget.color : Colors.white, //favorite ?
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Scene/lyric_scene.dart';

class LyricsButton extends StatefulWidget {
  final String author;
  final String songName;
  final double maxTimer;
  final bool isLooping;
  const LyricsButton({
    super.key,
    required this.author,
    required this.songName,
    required this.maxTimer,
    required this.isLooping,
  });

  @override
  State<LyricsButton> createState() => _LyricsButtonState();
}

class _LyricsButtonState extends State<LyricsButton> {
  bool shuffle = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LyricsScreen(
                author: widget.author,
                songName: widget.songName,
                maxTimer: widget.maxTimer,
                isLooping: widget.isLooping,
              ),
            ),
          );
          setState(() {
            shuffle = !shuffle;
          });
        },
        icon: const Icon(
          Icons.expand_circle_down_outlined, //buscar otro
          color: Colors.white,
        ));
  }
}

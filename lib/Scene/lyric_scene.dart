import 'package:flutter/material.dart';

import '../widgets/Play_Button.dart';
//import '../widgets/CurrentT.dart';
//import '../widgets/Slider.dart';

class LyricsScreen extends StatefulWidget {
  final String author;
  final String songName;
  final double maxTimer;
  final bool isLooping;
  const LyricsScreen({
    super.key,
    required this.author,
    required this.songName,
    required this.maxTimer,
    required this.isLooping,
  });

  @override
  State<LyricsScreen> createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Expanded(
        child: Container(
          color: const Color.fromARGB(255, 211, 159, 3),
          padding: const EdgeInsets.all(14.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.expand_circle_down_outlined, //buscar otro
                        color: Colors.white,
                        size: 25,
                      )),
                  Column(
                    children: [
                      Text(
                        widget.songName,
                        style: const TextStyle(
                            color: Colors.white,
                            //letterSpacing: 2,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.author,
                        style: const TextStyle(
                          color: Color.fromARGB(218, 255, 255, 255),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.flag_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      "I deixava caure el cos i "
                      "volava\nAl menys per un segons,"
                      "\nvolava\nI deixava caure el cos i volava\nI si no ho "
                      "feia tant se val\nCaure no feia mal\nAvisa l'avia, m'he "
                      "fet sang aquí\na la cama",
                      style: TextStyle(
                        height: 1.3,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 3,
                      ),
                    ),
                    Text(
                      "Entrem a casa\nQue t'ho natejo sota l'aigua\nAra un petó"
                      "d'aquells que tot\nho curaven\nQuan cure no feia mal"
                      "\nQuan cure no feia mal\nI quan bufava vent de nord\n"
                      "M'enfilava entre les branques\n de dalt de tot",
                      maxLines: 8,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          height: 1.3,
                          color: Color.fromARGB(255, 77, 54, 46),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 3),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              topLeft: Radius.circular(90),
                            )),
                      )),
                      Container(
                        width: 12.5,
                        height: 12.5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(90)),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(90),
                              topRight: Radius.circular(90),
                            )),
                      )),
                    ],
                  ),
                  /*SliderSong(
                    maxTimer: widget.maxTimer,
                    isLooping: widget.isLooping,
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      /* CurrentT(
                        maxTime: widget.maxTimer,
                      ),*/
                      Text(
                        "2:39",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "5:18",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 30, height: 20),
                      PlayButton(color: Colors.white),
                      Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// ignore_for_file: unnecessary_const

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/widgets/CurrentT.dart';
import 'package:layout/widgets/Fav_Button.dart';
import 'package:layout/widgets/Loop_Button.dart';
import 'package:layout/widgets/LyricsButton.dart';
import 'package:layout/widgets/Play_Button.dart';
import 'package:layout/widgets/Shuf_Button.dart';
import 'package:layout/widgets/Slider.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

void main() {
  runApp(const MyApp(
    songName: "Caure No Feia mal (with Santi Balmes)",
    author: "Joan Dausà, Santi Balmes",
    listName: "Random",
    currentTime: "2:39",
    maxTime: "5:18",
    currentTimer: 2.39,
    maxTimer: 5.18,
    isLooping: false,
  ));
}

class MyApp extends StatelessWidget {
  final String songName;
  final String author;
  final String listName;
  final double currentTimer;
  final String currentTime;
  final double maxTimer;
  final String maxTime;
  final bool isLooping;
  const MyApp(
      {super.key,
      required this.songName,
      required this.author,
      required this.listName,
      required this.currentTime,
      required this.maxTime,
      required this.currentTimer,
      required this.maxTimer,
      required this.isLooping});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Spoty(
        list: listName,
        author: author,
        songName: songName,
        maxTime: maxTime,
        currentTime: currentTime,
        currentTimer: currentTimer,
        maxTimer: maxTimer,
        isLooping: isLooping,
      ),
    );
  }
}

class Spoty extends StatelessWidget {
  final String list;
  final String author;
  final String songName;
  final String maxTime;
  final String currentTime;
  final double currentTimer;
  final double maxTimer;
  final bool isLooping;
  const Spoty({
    super.key,
    required this.list,
    required this.author,
    required this.songName,
    required this.maxTime,
    required this.currentTime,
    required this.currentTimer,
    required this.maxTimer,
    required this.isLooping,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: ListView(children: [
            BackGround(
              list: list,
              author: author,
              songName: songName,
              maxTime: maxTime,
              currentTime: currentTime,
              currentTimer: currentTimer,
              maxTimer: maxTimer,
              isLooping: isLooping,
            ),
          ]),
        ),
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  final String list;
  final String author;
  final String songName;
  final String maxTime;
  final String currentTime;
  final double currentTimer;
  final double maxTimer;
  final bool isLooping;
  const BackGround({
    super.key,
    required this.list,
    required this.author,
    required this.songName,
    required this.maxTime,
    required this.currentTime,
    required this.maxTimer,
    required this.currentTimer,
    required this.isLooping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 83, 141, 84),
          Color.fromARGB(255, 14, 14, 14)
        ],
        stops: [0.25, 0.6],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Header(list: list),
          const SizedBox(height: 50),
          const SongImage(),
          const SizedBox(height: 75),
          SongSettings(
            author: author,
            songName: songName,
            maxTime: maxTime,
            currentTime: currentTime,
            currentTimer: currentTimer,
            maxTimer: maxTimer,
            isLooping: isLooping,
          ),
          const SizedBox(height: 20),
          Liryc(
            author: author,
            songName: songName,
            maxTimer: maxTimer,
            isLooping: isLooping,
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String list;
  const Header({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.expand_more, color: Colors.white),
        Column(
          children: [
            const Text(
              "REPRODUCIENDO DESDE LISTA",
              style: TextStyle(
                  color: Colors.white, letterSpacing: 2, fontSize: 10),
            ),
            Text(
              list,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(Icons.more_vert, color: Colors.white),
      ],
    );
  }
}

class SongImage extends StatelessWidget {
  const SongImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.white,
      child: const Image(image: AssetImage('assets/portada.png')),
    );
  }
}

class SongSettings extends StatelessWidget {
  final String author;
  final String songName;
  final String maxTime;
  final String currentTime;
  final double currentTimer;
  final double maxTimer;
  final bool isLooping;
  const SongSettings({
    super.key,
    required this.author,
    required this.songName,
    required this.maxTime,
    required this.currentTime,
    required this.maxTimer,
    required this.currentTimer,
    required this.isLooping,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      height: 218, //218
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SongName(
            author: author,
            songName: songName,
          ),
          TimerBar(
            maxTime: maxTime,
            currentTime: currentTime,
            currentTimer: currentTimer,
            maxTimer: maxTimer,
            isLooping: isLooping,
          ),
          SongOptions(
            isLooping: isLooping,
          ),
          const ShareOptions()
        ],
      ),
    );
  }
}

class SongName extends StatelessWidget {
  final String author;
  final String songName;
  const SongName({
    super.key,
    required this.author,
    required this.songName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.start,
              author,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const FavoriteButton(color: Colors.green),
      ],
    );
  }
}

class SongOptions extends StatelessWidget {
  final bool isLooping;
  const SongOptions({
    required this.isLooping,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ShuffleButton(color: Colors.green),
        const SizedBox(
          width: 15,
          height: 10,
        ),
        Row(
          children: const [
            FaIcon(
              FontAwesomeIcons.backwardStep,
              color: Colors.white,
              size: 27,
            ),
            SizedBox(
              height: 10,
              width: 20,
            ),
            PlayButton(color: Colors.white),
            SizedBox(
              height: 10,
              width: 20,
            ),
            FaIcon(
              FontAwesomeIcons.forwardStep,
              color: Colors.white,
              size: 27,
            ),
          ],
        ),
        const SizedBox(
          width: 5,
          height: 10,
        ),
        Transform(
          alignment: Alignment.center,
          origin: Offset.fromDirection(-250),
          transform: Matrix4.rotationX(pi),
          child: LoopButton(
            color: Colors.green,
            isLooping: isLooping,
          ),
        )
      ],
    );
  }
}

class ShareOptions extends StatelessWidget {
  const ShareOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.speaker_group,
          color: Color.fromARGB(255, 235, 235, 235),
        ),
        Row(
          children: const [
            Icon(
              Icons.share_outlined,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              height: 10,
              width: 20,
            ),
            Icon(Typicons.th_menu, color: Colors.white),
          ],
        )
      ],
    );
  }
}

class Liryc extends StatelessWidget {
  final String author;
  final String songName;
  final double maxTimer;
  final bool isLooping;
  const Liryc({
    super.key,
    required this.author,
    required this.songName,
    required this.maxTimer,
    required this.isLooping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 475,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 211, 159, 3),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Letra",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              LyricsButton(
                author: author,
                songName: songName,
                maxTimer: maxTimer,
                isLooping: isLooping,
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "I si no ho feia tant se val \nCaure no feia mal \nAvisa l'àvia, mhe fet sang aquí a la cama",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Entrem a casa \nQue t'ho netejo sota l'aigua \nAra un petó d'aquells que tot ho curaven",
            style: TextStyle(
                color: Color.fromARGB(255, 77, 54, 46),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 35,
                width: 175,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "COMPARTIR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerBar extends StatelessWidget {
  final String maxTime;
  final String currentTime;
  final double currentTimer;
  final double maxTimer;
  final bool isLooping;
  const TimerBar({
    super.key,
    required this.maxTime,
    required this.currentTime,
    required this.currentTimer,
    required this.maxTimer,
    required this.isLooping,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Row(
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
        ),*/
        SliderSong(
          maxTimer: maxTimer,
          isLooping: isLooping,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*Text(
              currentTimer.toString(),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),*/
            CurrentT(
              maxTime: maxTimer,
            ),
            Text(
              maxTime,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }
}

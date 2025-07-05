import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  final List<Color> colorsList = [
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('audio/note$soundNumber.wav'),
    );
  }

  Widget createKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          playSound(soundNumber);
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: 3.0 * soundNumber, vertical: 6.0),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.block,
                  color: Colors.white,
                ),
                Icon(
                  Icons.block,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildButtons() {
    List<Widget> buttonsList = [];
    for (int i = 0; i < colorsList.length; i++) {
      buttonsList.add(
        createKey(color: colorsList[i], soundNumber: i),
      );
    }
    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey,
                Colors.blueGrey,
                Colors.white,
              ],
              tileMode: TileMode.repeated,
            ),
          ),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top, horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: buildButtons(),
          ),
        ),
      ),
    );
  }
}

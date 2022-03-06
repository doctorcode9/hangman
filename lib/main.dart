import 'package:flutter/material.dart';
import 'package:hangman_game/ui/components/figure.dart';
import 'package:hangman_game/ui/components/hidden_word.dart';
import 'package:hangman_game/ui/components/keyboard.dart';
import 'package:hangman_game/ui/style/color.dart';
import 'package:hangman_game/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String word = "Dart".toUpperCase();
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Center(child: figure(Game.tries)),
          hiddenWord("Dart"),
          keyboard(), */
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "assets/figure/hang.png"),
                figureImage(Game.tries >= 1, "assets/figure/head.png"),
                figureImage(Game.tries >= 2, "assets/figure/body.png"),
                figureImage(Game.tries >= 3, "assets/figure/ra.png"),
                figureImage(Game.tries >= 4, "assets/figure/la.png"),
                figureImage(Game.tries >= 5, "assets/figure/rl.png"),
                figureImage(Game.tries >= 6, "assets/figure/ll.png"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(
            width: double.infinity,
            height: 350.0,
            child: GridView.count(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              crossAxisCount: 6,
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : AppColor.primaryColorDark,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
